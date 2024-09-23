@implementation AADevice

- (AADevice)initWithDictionary:(id)a3
{
  id v4;
  AADevice *v5;
  uint64_t v6;
  NSString *model;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSString *osVersion;
  uint64_t v12;
  NSString *swVersion;
  uint64_t v14;
  NSString *modelSmallPhotoURL3x;
  uint64_t v16;
  NSString *modelSmallPhotoURL2x;
  uint64_t v18;
  NSString *modelSmallPhotoURL1x;
  uint64_t v20;
  NSString *modelLargePhotoURL3x;
  uint64_t v22;
  NSString *modelLargePhotoURL2x;
  uint64_t v24;
  NSString *modelLargePhotoURL1x;
  uint64_t v26;
  NSString *modelDisplayName;

  v4 = a3;
  v5 = -[AADevice init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("model"));
    v6 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("osVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("swVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    swVersion = v5->_swVersion;
    v5->_swVersion = (NSString *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelSmallPhotoURL3x"));
    v14 = objc_claimAutoreleasedReturnValue();
    modelSmallPhotoURL3x = v5->_modelSmallPhotoURL3x;
    v5->_modelSmallPhotoURL3x = (NSString *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelSmallPhotoURL2x"));
    v16 = objc_claimAutoreleasedReturnValue();
    modelSmallPhotoURL2x = v5->_modelSmallPhotoURL2x;
    v5->_modelSmallPhotoURL2x = (NSString *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelSmallPhotoURL1x"));
    v18 = objc_claimAutoreleasedReturnValue();
    modelSmallPhotoURL1x = v5->_modelSmallPhotoURL1x;
    v5->_modelSmallPhotoURL1x = (NSString *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelLargePhotoURL3x"));
    v20 = objc_claimAutoreleasedReturnValue();
    modelLargePhotoURL3x = v5->_modelLargePhotoURL3x;
    v5->_modelLargePhotoURL3x = (NSString *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelLargePhotoURL2x"));
    v22 = objc_claimAutoreleasedReturnValue();
    modelLargePhotoURL2x = v5->_modelLargePhotoURL2x;
    v5->_modelLargePhotoURL2x = (NSString *)v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelLargePhotoURL1x"));
    v24 = objc_claimAutoreleasedReturnValue();
    modelLargePhotoURL1x = v5->_modelLargePhotoURL1x;
    v5->_modelLargePhotoURL1x = (NSString *)v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("modelDisplayName"));
    v26 = objc_claimAutoreleasedReturnValue();
    modelDisplayName = v5->_modelDisplayName;
    v5->_modelDisplayName = (NSString *)v26;

  }
  return v5;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)swVersion
{
  return self->_swVersion;
}

- (NSString)modelSmallPhotoURL3x
{
  return self->_modelSmallPhotoURL3x;
}

- (NSString)modelSmallPhotoURL2x
{
  return self->_modelSmallPhotoURL2x;
}

- (NSString)modelSmallPhotoURL1x
{
  return self->_modelSmallPhotoURL1x;
}

- (NSString)modelLargePhotoURL3x
{
  return self->_modelLargePhotoURL3x;
}

- (NSString)modelLargePhotoURL2x
{
  return self->_modelLargePhotoURL2x;
}

- (NSString)modelLargePhotoURL1x
{
  return self->_modelLargePhotoURL1x;
}

- (NSString)modelDisplayName
{
  return self->_modelDisplayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelDisplayName, 0);
  objc_storeStrong((id *)&self->_modelLargePhotoURL1x, 0);
  objc_storeStrong((id *)&self->_modelLargePhotoURL2x, 0);
  objc_storeStrong((id *)&self->_modelLargePhotoURL3x, 0);
  objc_storeStrong((id *)&self->_modelSmallPhotoURL1x, 0);
  objc_storeStrong((id *)&self->_modelSmallPhotoURL2x, 0);
  objc_storeStrong((id *)&self->_modelSmallPhotoURL3x, 0);
  objc_storeStrong((id *)&self->_swVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
