@implementation CLSClue

- (CLSClue)init
{
  CLSClue *v2;
  CLSClue *v3;
  NSString *key;
  id value;
  CLSInformant *informant;
  CLSProfile *profile;
  NSString *informantIdentifier;
  NSString *profileIdentifier;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CLSClue;
  v2 = -[CLSClue init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    key = v2->_key;
    v2->_key = 0;

    value = v3->_value;
    v3->_value = 0;

    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v3->_confidence = _Q0;
    informant = v3->_informant;
    v3->_informant = 0;

    profile = v3->_profile;
    v3->_profile = 0;

    informantIdentifier = v3->_informantIdentifier;
    v3->_informantIdentifier = 0;

    profileIdentifier = v3->_profileIdentifier;
    v3->_profileIdentifier = 0;

    v3->_transient = 0;
    v3->_versionCount = 1;
  }
  return v3;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;

  -[CLSClue value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[CLSClue value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v6, "flattenWithSeparator:", CFSTR(", "));
  else
    objc_msgSend(v6, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB37A0];
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSClue key](self, "key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@> key:[%@] value:[%@]"), v11, v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLSClue confidence](self, "confidence");
  v15 = v14;
  -[CLSClue relevance](self, "relevance");
  v17 = v16;
  -[CLSClue score](self, "score");
  v19 = v18;
  -[CLSClue informant](self, "informant");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[CLSClue informant](self, "informant");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CLSClue informantIdentifier](self, "informantIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v23;
  }
  -[CLSClue profile](self, "profile");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[CLSClue profile](self, "profile");
    v2 = objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
  }
  else
  {
    -[CLSClue profileIdentifier](self, "profileIdentifier");
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendFormat:", CFSTR("\n\tconfidence:[%.2f] relevance:[%.2f] score:[%.2f] informant:[%@] profile:[%@] version:[%ld]"), v15, v17, v19, v23, v26, -[CLSClue versionCount](self, "versionCount"));
  if (v24)
  {

    v26 = (void *)v2;
  }

  if (v20)
  return v13;
}

- (unint64_t)valueHash
{
  void *v2;
  unint64_t v3;

  -[CLSClue value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (unint64_t)enumValue
{
  void *v2;
  unint64_t v3;

  -[CLSClue value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (id)stringValue
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;

  -[CLSClue value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[CLSClue value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v5, "stringValue");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

- (int64_t)integerValue
{
  void *v2;
  int64_t v3;

  -[CLSClue value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (double)doubleValue
{
  void *v2;
  double v3;
  double v4;

  -[CLSClue value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (void)_incrementVersionCount
{
  CLSClue *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_versionCount;
  objc_sync_exit(obj);

}

- (double)score
{
  return self->_confidence * self->_relevance;
}

- (NSString)informantIdentifier
{
  CLSInformant *informantIdentifier;
  NSString *v4;
  NSString *v5;

  informantIdentifier = (CLSInformant *)self->_informantIdentifier;
  if (!informantIdentifier)
  {
    informantIdentifier = self->_informant;
    if (informantIdentifier)
    {
      objc_msgSend((id)objc_opt_class(), "identifier");
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      v5 = self->_informantIdentifier;
      self->_informantIdentifier = v4;

      informantIdentifier = (CLSInformant *)self->_informantIdentifier;
    }
  }
  return (NSString *)informantIdentifier;
}

- (void)setInformantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_informantIdentifier, a3);
}

- (NSString)profileIdentifier
{
  CLSProfile *profileIdentifier;
  NSString *v4;
  NSString *v5;

  profileIdentifier = (CLSProfile *)self->_profileIdentifier;
  if (!profileIdentifier)
  {
    profileIdentifier = self->_profile;
    if (profileIdentifier)
    {
      objc_msgSend((id)objc_opt_class(), "identifier");
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      v5 = self->_profileIdentifier;
      self->_profileIdentifier = v4;

      profileIdentifier = (CLSProfile *)self->_profileIdentifier;
    }
  }
  return (NSString *)profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_profileIdentifier, a3);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[CLSClue value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[CLSClue key](self, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    -[CLSClue value](self, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      -[CLSClue key](self, "key");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "key");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v10, "isEqual:", v11);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  NSString *key;
  int64_t v6;

  v4 = a3;
  key = self->_key;
  if (!key || !self->_value)
    __assert_rtn("-[CLSClue compare:]", "CLSClue.m", 246, "(_key != nil) && (_value != nil)");
  v6 = -[NSString compare:](key, "compare:", v4[2]);
  if (!v6)
  {
    v6 = objc_msgSend(self->_value, "compare:", v4[3]);
    if (!v6)
      v6 = -[CLSClue compareScore:](self, "compareScore:", v4);
  }

  return v6;
}

- (int64_t)compareScore:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[CLSClue score](self, "score");
  v6 = v5;
  objc_msgSend(v4, "score");
  v8 = v7;

  if (v6 > v8)
    return -1;
  else
    return v6 < v8;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)value
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (double)relevance
{
  return self->_relevance;
}

- (void)setRelevance:(double)a3
{
  self->_relevance = a3;
}

- (NSDictionary)extraParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExtraParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CLSInformant)informant
{
  return (CLSInformant *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInformant:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CLSProfile)profile
{
  return (CLSProfile *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProfile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)transient
{
  return self->_transient;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (unint64_t)versionCount
{
  return self->_versionCount;
}

- (void)setVersionCount:(unint64_t)a3
{
  self->_versionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_informantIdentifier, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_informant, 0);
  objc_storeStrong((id *)&self->_extraParameters, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)_clueWithValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setKey:", v6);

  objc_msgSend(v8, "setValue:", v7);
  return v8;
}

+ (id)_clueWithValue:(id)a3 forKey:(id)a4 confidence:(double)a5 relevance:(double)a6
{
  void *v8;

  objc_msgSend(a1, "_clueWithValue:forKey:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfidence:", a5);
  objc_msgSend(v8, "setRelevance:", a6);
  return v8;
}

@end
