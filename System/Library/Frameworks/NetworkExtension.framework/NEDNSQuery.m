@implementation NEDNSQuery

- (NEDNSQuery)initWithName:(id)a3 recordType:(int64_t)a4 recordClass:(int64_t)a5
{
  id v9;
  NEDNSQuery *v10;
  NEDNSQuery *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEDNSQuery;
  v10 = -[NEDNSQuery init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_recordType = a4;
    v11->_recordClass = a5;
  }

  return v11;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (int64_t)recordClass
{
  return self->_recordClass;
}

- (NSData)answerData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAnswerData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (unsigned)answerTTL
{
  return self->_answerTTL;
}

- (void)setAnswerTTL:(unsigned int)a3
{
  self->_answerTTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_answerData, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
