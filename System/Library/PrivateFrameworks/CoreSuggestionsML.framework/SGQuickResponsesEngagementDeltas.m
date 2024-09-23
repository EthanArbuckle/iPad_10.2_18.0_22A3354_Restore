@implementation SGQuickResponsesEngagementDeltas

- (SGQuickResponsesEngagementDeltas)initWithLangResponse:(id)a3 displayed:(int)a4 selected:(int)a5 matched:(int)a6
{
  id v11;
  SGQuickResponsesEngagementDeltas *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *lang;
  NSString *response;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v11 = a3;
  if (v11)
  {
    if ((a4 & 0x80000000) == 0)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesStore.m"), 1336, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("langResponse"));

    if ((a4 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a5 & 0x80000000) == 0)
        goto LABEL_4;
LABEL_12:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesStore.m"), 1338, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selected >= 0"));

      if ((a6 & 0x80000000) == 0)
        goto LABEL_5;
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesStore.m"), 1337, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayed >= 0"));

  if (a5 < 0)
    goto LABEL_12;
LABEL_4:
  if ((a6 & 0x80000000) == 0)
    goto LABEL_5;
LABEL_13:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGQuickResponsesStore.m"), 1339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("matched >= 0"));

LABEL_5:
  v23.receiver = self;
  v23.super_class = (Class)SGQuickResponsesEngagementDeltas;
  v12 = -[SGQuickResponsesEngagementDeltas init](&v23, sel_init);
  if (v12)
  {
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("|"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 != 1)
    {
      lang = v12->_lang;
      v12->_lang = (NSString *)v15;

      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    response = v12->_response;
    v12->_response = (NSString *)v15;

    v12->_displayed = a4;
    v12->_selected = a5;
    v12->_matched = a6;

  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *response;
  id v5;

  response = self->_response;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", response, CFSTR("response"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lang, CFSTR("lang"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_displayed, CFSTR("displayed"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_selected, CFSTR("selected"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_matched, CFSTR("matched"));

}

- (SGQuickResponsesEngagementDeltas)initWithCoder:(id)a3
{
  id v4;
  SGQuickResponsesEngagementDeltas *v5;
  void *v6;
  uint64_t v7;
  NSString *response;
  void *v9;
  uint64_t v10;
  NSString *lang;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SGQuickResponsesEngagementDeltas;
  v5 = -[SGQuickResponsesEngagementDeltas init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("response"));
    v7 = objc_claimAutoreleasedReturnValue();
    response = v5->_response;
    v5->_response = (NSString *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("lang"));
    v10 = objc_claimAutoreleasedReturnValue();
    lang = v5->_lang;
    v5->_lang = (NSString *)v10;

    v5->_displayed = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("displayed"));
    v5->_selected = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("selected"));
    v5->_matched = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("matched"));
  }

  return v5;
}

- (BOOL)isEqualToQuickResponsesEngagementDeltas:(id)a3
{
  id *v4;
  NSString *response;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *lang;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  int displayed;
  int selected;
  int matched;
  BOOL v18;

  v4 = (id *)a3;
  response = self->_response;
  v6 = (NSString *)v4[3];
  if (response == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = response;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
LABEL_12:
      v18 = 0;
      goto LABEL_13;
    }
  }
  lang = self->_lang;
  v11 = (NSString *)v4[4];
  if (lang == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = lang;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_12;
  }
  displayed = self->_displayed;
  if (displayed != objc_msgSend(v4, "displayed"))
    goto LABEL_12;
  selected = self->_selected;
  if (selected != objc_msgSend(v4, "selected"))
    goto LABEL_12;
  matched = self->_matched;
  v18 = matched == objc_msgSend(v4, "matched");
LABEL_13:

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  SGQuickResponsesEngagementDeltas *v4;
  SGQuickResponsesEngagementDeltas *v5;
  BOOL v6;

  v4 = (SGQuickResponsesEngagementDeltas *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGQuickResponsesEngagementDeltas isEqualToQuickResponsesEngagementDeltas:](self, "isEqualToQuickResponsesEngagementDeltas:", v5);

  return v6;
}

- (NSString)response
{
  return self->_response;
}

- (NSString)lang
{
  return self->_lang;
}

- (int)displayed
{
  return self->_displayed;
}

- (int)selected
{
  return self->_selected;
}

- (int)matched
{
  return self->_matched;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lang, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
