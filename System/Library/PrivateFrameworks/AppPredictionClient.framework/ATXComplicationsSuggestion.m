@implementation ATXComplicationsSuggestion

- (ATXComplicationsSuggestion)initWithSubtitleComplication:(id)a3 layoutType:(int64_t)a4 complications:(id)a5
{
  id v8;
  id v9;
  ATXComplicationsSuggestion *v10;
  uint64_t v11;
  ATXComplication *subtitleComplication;
  uint64_t v13;
  NSArray *complications;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ATXComplicationsSuggestion;
  v10 = -[ATXComplicationsSuggestion init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    subtitleComplication = v10->_subtitleComplication;
    v10->_subtitleComplication = (ATXComplication *)v11;

    v10->_layoutType = a4;
    v13 = objc_msgSend(v9, "copy");
    complications = v10->_complications;
    v10->_complications = (NSArray *)v13;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXComplicationsSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ATXComplicationsSuggestion *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitleComplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("layoutType"));
  v7 = (void *)MEMORY[0x1E0C99E60];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("complications"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ATXComplicationsSuggestion initWithSubtitleComplication:layoutType:complications:](self, "initWithSubtitleComplication:layoutType:complications:", v5, v6, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ATXComplicationsSuggestion subtitleComplication](self, "subtitleComplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("subtitleComplication"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXComplicationsSuggestion layoutType](self, "layoutType"), CFSTR("layoutType"));
  -[ATXComplicationsSuggestion complications](self, "complications");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("complications"));

}

- (ATXComplication)subtitleComplication
{
  return self->_subtitleComplication;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (NSArray)complications
{
  return self->_complications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complications, 0);
  objc_storeStrong((id *)&self->_subtitleComplication, 0);
}

@end
