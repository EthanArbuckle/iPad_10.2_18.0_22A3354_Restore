@implementation PHUserFeedbackImportantPerson

- (PHUserFeedbackImportantPerson)initWithPersonUUID:(id)a3 type:(unint64_t)a4
{
  id v7;
  PHUserFeedbackImportantPerson *v8;
  PHUserFeedbackImportantPerson *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHUserFeedbackImportantPerson;
  v8 = -[PHUserFeedbackImportantPerson init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_personUUID, a3);
    v9->_type = a4;
  }

  return v9;
}

- (NSString)personUUID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personUUID, 0);
}

@end
