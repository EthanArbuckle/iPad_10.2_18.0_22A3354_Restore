@implementation HMBulletinObjectTuple

- (HMBulletinObjectTuple)initWithQueryType:(int64_t)a3 uuidString:(id)a4
{
  id v6;
  HMBulletinObjectTuple *v7;
  HMBulletinObjectTuple *v8;
  NSString *queryName;
  const __CFString *v10;
  NSString *v11;
  NSString *uuidString;
  uint64_t v13;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMBulletinObjectTuple;
  v7 = -[HMBulletinObjectTuple init](&v15, sel_init);
  v8 = v7;
  switch(a3)
  {
    case 0:
      queryName = v7->_queryName;
      v10 = CFSTR("home");
      goto LABEL_11;
    case 1:
      queryName = v7->_queryName;
      v10 = CFSTR("accessory");
      goto LABEL_11;
    case 2:
      queryName = v7->_queryName;
      v10 = CFSTR("service");
      goto LABEL_11;
    case 3:
      queryName = v7->_queryName;
      v10 = CFSTR("characteristic");
      goto LABEL_11;
    case 4:
      queryName = v7->_queryName;
      v10 = CFSTR("invitation");
      goto LABEL_11;
    case 5:
      queryName = v7->_queryName;
      v10 = CFSTR("accessoryProfile");
      goto LABEL_11;
    case 6:
      queryName = v7->_queryName;
      v10 = CFSTR("trigger");
      goto LABEL_11;
    case 7:
      v11 = v7->_queryName;
      v7->_queryName = (NSString *)CFSTR("tab");

      uuidString = v8->_uuidString;
      v8->_uuidString = (NSString *)CFSTR("home");
      goto LABEL_12;
    case 8:
      queryName = v7->_queryName;
      v10 = CFSTR("firmwareUpdate");
LABEL_11:
      v7->_queryName = &v10->isa;

      v13 = objc_msgSend(v6, "copy");
      uuidString = v8->_uuidString;
      v8->_uuidString = (NSString *)v13;
LABEL_12:

      break;
    default:
      break;
  }

  return v8;
}

- (NSString)queryName
{
  return self->_queryName;
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_queryName, 0);
}

+ (id)tupleWithQueryType:(int64_t)a3 uuidString:(id)a4
{
  id v5;
  HMBulletinObjectTuple *v6;

  v5 = a4;
  v6 = -[HMBulletinObjectTuple initWithQueryType:uuidString:]([HMBulletinObjectTuple alloc], "initWithQueryType:uuidString:", a3, v5);

  return v6;
}

@end
