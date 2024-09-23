@implementation EKImageKey

- (EKImageKey)initWithSourceID:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  EKImageKey *v9;
  EKImageKey *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EKImageKey;
  v9 = -[EKImageKey init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceID, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  id *v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (id *)v4;
    if (objc_msgSend(v7[1], "isEqual:", self->_sourceID))
      v6 = objc_msgSend(v7[2], "isEqualToString:", self->_identifier);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[EKObjectID hash](self->_sourceID, "hash");
  return -[NSString hash](self->_identifier, "hash") ^ v3;
}

- (EKObjectID)sourceID
{
  return self->_sourceID;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
}

@end
