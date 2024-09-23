@implementation LACUserInterfaceRequestCoder

- (id)encode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[LACUserInterfaceRequestCoder _encodingKey](self, "_encodingKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceRequestCoder _serialize:](self, "_serialize:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9 = v5;
    v10[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v7;
}

- (id)decode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[LACUserInterfaceRequestCoder _encodingKey](self, "_encodingKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[LACUserInterfaceRequestCoder _deserialize:](self, "_deserialize:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_serialize:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
}

- (id)_deserialize:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD1620];
  v4 = a3;
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_encodingKey
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
