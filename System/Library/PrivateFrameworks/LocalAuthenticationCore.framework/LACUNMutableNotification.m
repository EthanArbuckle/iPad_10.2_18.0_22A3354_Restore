@implementation LACUNMutableNotification

- (NSString)description
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[12];
  _QWORD v36[14];

  v36[12] = *MEMORY[0x24BDAC8D0];
  v31 = (void *)MEMORY[0x24BDD17C8];
  v30 = objc_opt_class();
  v35[0] = CFSTR("identifier");
  -[LACUNMutableNotification identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v34 = v4;
  v27 = (void *)v3;
  v36[0] = v3;
  v35[1] = CFSTR("categoryIdentifier");
  -[LACUNMutableNotification categoryIdentifier](self, "categoryIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)v5;
  v36[1] = v5;
  v35[2] = CFSTR("shouldDisplayActionsInline");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACUNMutableNotification shouldDisplayActionsInline](self, "shouldDisplayActionsInline"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v32;
  v35[3] = CFSTR("title");
  -[LACUNMutableNotification title](self, "title");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v7;
  v36[3] = v7;
  v35[4] = CFSTR("isTitleLocalized");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACUNMutableNotification isTitleLocalized](self, "isTitleLocalized"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v29;
  v35[5] = CFSTR("body");
  -[LACUNMutableNotification body](self, "body");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v33 = v6;
  v24 = (void *)v9;
  v36[5] = v9;
  v35[6] = CFSTR("isBodyLocalized");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACUNMutableNotification isBodyLocalized](self, "isBodyLocalized"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v28;
  v35[7] = CFSTR("systemIconName");
  -[LACUNMutableNotification systemIconName](self, "systemIconName");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v11;
  v36[7] = v11;
  v35[8] = CFSTR("defaultActionURL");
  -[LACUNMutableNotification defaultActionURL](self, "defaultActionURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[8] = v14;
  v35[9] = CFSTR("isTimeSensitive");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACUNMutableNotification isTimeSensitive](self, "isTimeSensitive"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36[9] = v15;
  v35[10] = CFSTR("withdrawInterval");
  v16 = (void *)MEMORY[0x24BDD16E0];
  -[LACUNMutableNotification withdrawInterval](self, "withdrawInterval");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[10] = v17;
  v35[11] = CFSTR("triggerInterval");
  v18 = (void *)MEMORY[0x24BDD16E0];
  -[LACUNMutableNotification triggerInterval](self, "triggerInterval");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[11] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v30, self, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  if (!v12)

  if (!v10)
  if (!v8)

  if (!v33)
  if (!v34)

  return (NSString *)v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  int v44;
  int v45;
  int v46;
  double v47;
  double v48;
  double v49;
  double v51;
  double v52;
  double v53;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_257087648))
  {
    v5 = v4;
    -[LACUNMutableNotification identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[LACUNMutableNotification identifier](self, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v11)
        goto LABEL_32;
    }
    -[LACUNMutableNotification categoryIdentifier](self, "categoryIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categoryIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[LACUNMutableNotification categoryIdentifier](self, "categoryIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "categoryIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if (!v18)
        goto LABEL_32;
    }
    v19 = -[LACUNMutableNotification shouldDisplayActionsInline](self, "shouldDisplayActionsInline");
    if (v19 == objc_msgSend(v5, "shouldDisplayActionsInline"))
    {
      -[LACUNMutableNotification title](self, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[LACUNMutableNotification title](self, "title");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "title");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqualToString:", v24);

        if (!v25)
          goto LABEL_32;
      }
      -[LACUNMutableNotification body](self, "body");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "body");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[LACUNMutableNotification body](self, "body");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "body");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqualToString:", v30);

        if (!v31)
          goto LABEL_32;
      }
      -[LACUNMutableNotification systemIconName](self, "systemIconName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "systemIconName");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        -[LACUNMutableNotification systemIconName](self, "systemIconName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "systemIconName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqualToString:", v36);

        if (!v37)
          goto LABEL_32;
      }
      -[LACUNMutableNotification defaultActionURL](self, "defaultActionURL");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "defaultActionURL");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v38 == (void *)v39)
      {

      }
      else
      {
        v40 = (void *)v39;
        -[LACUNMutableNotification defaultActionURL](self, "defaultActionURL");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "defaultActionURL");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "isEqual:", v42);

        if (!v43)
          goto LABEL_32;
      }
      v44 = -[LACUNMutableNotification isTitleLocalized](self, "isTitleLocalized");
      if (v44 == objc_msgSend(v5, "isTitleLocalized"))
      {
        v45 = -[LACUNMutableNotification isBodyLocalized](self, "isBodyLocalized");
        if (v45 == objc_msgSend(v5, "isBodyLocalized"))
        {
          v46 = -[LACUNMutableNotification isTimeSensitive](self, "isTimeSensitive");
          if (v46 == objc_msgSend(v5, "isTimeSensitive"))
          {
            -[LACUNMutableNotification withdrawInterval](self, "withdrawInterval");
            v48 = v47;
            objc_msgSend(v5, "withdrawInterval");
            if (v48 == v49)
            {
              -[LACUNMutableNotification triggerInterval](self, "triggerInterval");
              v52 = v51;
              objc_msgSend(v5, "triggerInterval");
              v12 = v52 == v53;
              goto LABEL_33;
            }
          }
        }
      }
    }
LABEL_32:
    v12 = 0;
LABEL_33:

    goto LABEL_34;
  }
  v12 = 0;
LABEL_34:

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_categoryIdentifier, a3);
}

- (BOOL)shouldDisplayActionsInline
{
  return self->_shouldDisplayActionsInline;
}

- (void)setShouldDisplayActionsInline:(BOOL)a3
{
  self->_shouldDisplayActionsInline = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)isTitleLocalized
{
  return self->_isTitleLocalized;
}

- (void)setIsTitleLocalized:(BOOL)a3
{
  self->_isTitleLocalized = a3;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (BOOL)isBodyLocalized
{
  return self->_isBodyLocalized;
}

- (void)setIsBodyLocalized:(BOOL)a3
{
  self->_isBodyLocalized = a3;
}

- (NSString)systemIconName
{
  return self->_systemIconName;
}

- (void)setSystemIconName:(id)a3
{
  objc_storeStrong((id *)&self->_systemIconName, a3);
}

- (NSURL)defaultActionURL
{
  return self->_defaultActionURL;
}

- (void)setDefaultActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_defaultActionURL, a3);
}

- (BOOL)isTimeSensitive
{
  return self->_isTimeSensitive;
}

- (void)setIsTimeSensitive:(BOOL)a3
{
  self->_isTimeSensitive = a3;
}

- (double)withdrawInterval
{
  return self->_withdrawInterval;
}

- (void)setWithdrawInterval:(double)a3
{
  self->_withdrawInterval = a3;
}

- (double)triggerInterval
{
  return self->_triggerInterval;
}

- (void)setTriggerInterval:(double)a3
{
  self->_triggerInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultActionURL, 0);
  objc_storeStrong((id *)&self->_systemIconName, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
