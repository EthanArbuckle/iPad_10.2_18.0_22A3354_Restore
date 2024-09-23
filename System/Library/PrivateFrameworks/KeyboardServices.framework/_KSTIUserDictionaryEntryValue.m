@implementation _KSTIUserDictionaryEntryValue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)valueWithEntry:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "phrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPhrase:", v6);

  objc_msgSend(v4, "shortcut");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShortcut:", v7);

  objc_msgSend(v4, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTimestamp:", v8);
  return v5;
}

- (_KSTIUserDictionaryEntryValue)initWithCoder:(id)a3
{
  id v4;
  _KSTIUserDictionaryEntryValue *v5;
  void *v6;
  uint64_t v7;
  NSString *phrase;
  void *v9;
  uint64_t v10;
  NSString *shortcut;
  uint64_t v12;
  NSDate *timestamp;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_KSTIUserDictionaryEntryValue;
  v5 = -[_KSTIUserDictionaryEntryValue init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phrase"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    phrase = v5->_phrase;
    v5->_phrase = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcut"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    shortcut = v5->_shortcut;
    v5->_shortcut = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v12 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *phrase;
  NSString *shortcut;
  NSDate *timestamp;
  id v8;

  v4 = a3;
  phrase = self->_phrase;
  v8 = v4;
  if (phrase)
  {
    objc_msgSend(v4, "encodeObject:forKey:", phrase, CFSTR("phrase"));
    v4 = v8;
  }
  shortcut = self->_shortcut;
  if (shortcut)
  {
    objc_msgSend(v8, "encodeObject:forKey:", shortcut, CFSTR("shortcut"));
    v4 = v8;
  }
  timestamp = self->_timestamp;
  if (timestamp)
  {
    objc_msgSend(v8, "encodeObject:forKey:", timestamp, CFSTR("timestamp"));
    v4 = v8;
  }

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[_KSTIUserDictionaryEntryValue shortcut](self, "shortcut");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_KSTIUserDictionaryEntryValue phrase](self, "phrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@ => %@}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)matchesEntry:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  -[_KSTIUserDictionaryEntryValue phrase](self, "phrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phrase");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    -[_KSTIUserDictionaryEntryValue phrase](self, "phrase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = v6 == 0;
  }

  -[_KSTIUserDictionaryEntryValue shortcut](self, "shortcut");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortcut");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
  {
    -[_KSTIUserDictionaryEntryValue shortcut](self, "shortcut");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

  }
  else
  {
    v14 = v11 == 0;
  }

  return v9 & v14;
}

- (id)shortcutForSorting
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[_KSTIUserDictionaryEntryValue shortcut](self, "shortcut");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24E206F98;
  v4 = v2;

  return v4;
}

- (NSString)phrase
{
  return self->_phrase;
}

- (void)setPhrase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)shortcut
{
  return self->_shortcut;
}

- (void)setShortcut:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
}

@end
