@implementation ATXBoostObject

- (ATXBoostObject)initWithDictionary:(id)a3
{
  id v4;
  ATXBoostObject *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ATXBoostObject;
  v5 = -[ATXBoostObject init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Work"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("boost"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v5->_workBoost = v9;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("scale"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v5->_workScale = v11;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Home"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("boost"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v5->_homeBoost = v14;

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("scale"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v5->_homeScale = v16;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Gym"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("boost"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v5->_gymBoost = v19;

      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("scale"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v5->_gymScale = v21;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("School"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("boost"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v5->_schoolBoost = v24;

      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("scale"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v5->_schoolScale = v26;

    }
  }

  return v5;
}

- (double)workBoost
{
  return self->_workBoost;
}

- (double)workScale
{
  return self->_workScale;
}

- (double)homeBoost
{
  return self->_homeBoost;
}

- (double)homeScale
{
  return self->_homeScale;
}

- (double)gymBoost
{
  return self->_gymBoost;
}

- (double)gymScale
{
  return self->_gymScale;
}

- (double)schoolBoost
{
  return self->_schoolBoost;
}

- (double)schoolScale
{
  return self->_schoolScale;
}

@end
