@implementation NSBatchInsertRequestEncodingToken

- (id)initForRequest:(id)a3
{
  NSBatchInsertRequestEncodingToken *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSBatchInsertRequestEncodingToken;
  v4 = -[NSBatchInsertRequestEncodingToken init](&v6, sel_init);
  if (v4)
  {
    v4->_entityName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "entityName"), "copy");
    v4->_objectsToInsert = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "objectsToInsert"), "copy");
    v4->_resultType = objc_msgSend(a3, "resultType");
    v4->_secure = objc_msgSend(a3, "_secureOperation");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_entityName = 0;
  self->_objectsToInsert = 0;

  self->_inputStream = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBatchInsertRequestEncodingToken;
  -[NSBatchInsertRequestEncodingToken dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSBatchInsertRequestEncodingToken)initWithCoder:(id)a3
{
  NSBatchInsertRequestEncodingToken *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSBatchInsertRequestEncodingToken;
  v4 = -[NSBatchInsertRequestEncodingToken init](&v7, sel_init);
  if (v4)
  {
    v4->_entityName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityName"));
    v5 = (void *)+[_NSXPCStoreUtilities classesForSaveArchive]();
    if (objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "count"))
      v5 = (void *)objc_msgSend(v5, "setByAddingObjectsFromSet:", objc_msgSend(a3, "allowedClasses"));
    v4->_objectsToInsert = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v5, CFSTR("objectsToInsert"));
    v4->_inputStream = (NSInputStream *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputStream"));
    v4->_resultType = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("resultType"));
    v4->_secure = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("secure"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_entityName, CFSTR("entityName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_objectsToInsert, CFSTR("objectsToInsert"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_inputStream, CFSTR("inputStream"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_resultType, CFSTR("resultType"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_secure, CFSTR("secure"));
}

- (NSString)entityName
{
  return self->_entityName;
}

- (NSArray)objectsToInsert
{
  return self->_objectsToInsert;
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (BOOL)secure
{
  return self->_secure;
}

@end
