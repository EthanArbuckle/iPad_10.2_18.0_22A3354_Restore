@implementation CRKExpiredCourseAlertText

- (CRKExpiredCourseAlertText)initWithCourse:(id)a3
{
  id v6;
  CRKExpiredCourseAlertText *v7;
  CRKExpiredCourseAlertText *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKExpiredCourseAlertText.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("course"));

  }
  v11.receiver = self;
  v11.super_class = (Class)CRKExpiredCourseAlertText;
  v7 = -[CRKExpiredCourseAlertText init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_course, a3);

  return v8;
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("“%@” has expired and will be removed"), &stru_24D9CB490, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKExpiredCourseAlertText course](self, "course");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "courseName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)acknowledgeOptionTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Remove"), &stru_24D9CB490, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)message
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Classes that have not been joined for more than a year are automatically removed."), &stru_24D9CB490, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CRKCourse)course
{
  return self->_course;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_course, 0);
}

+ (id)new
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRKExpiredCourseAlertText.m"), 55, CFSTR("%@ is unavailable for %@"), v5, a1);

  return 0;
}

- (CRKExpiredCourseAlertText)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKExpiredCourseAlertText.m"), 60, CFSTR("%@ is unavailable for %@"), v5, self);

  return 0;
}

@end
