@implementation NTKGreenfieldComplicationSharingOption

+ (id)optionWithName:(id)a3 uniqueIdentifier:(id)a4 optionType:(unint64_t)a5
{
  id v7;
  id v8;
  NTKGreenfieldComplicationSharingOption *v9;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *uniqueIdentifier;

  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(NTKGreenfieldComplicationSharingOption);
  v10 = objc_msgSend(v8, "copy");

  name = v9->_name;
  v9->_name = (NSString *)v10;

  v12 = objc_msgSend(v7, "copy");
  uniqueIdentifier = v9->_uniqueIdentifier;
  v9->_uniqueIdentifier = (NSString *)v12;

  v9->_optionType = a5;
  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (unint64_t)optionType
{
  return self->_optionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
