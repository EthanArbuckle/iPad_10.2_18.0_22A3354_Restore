@implementation LUISchoolManager

+ (id)sharedInstance
{
  if (qword_100088D88 != -1)
    dispatch_once(&qword_100088D88, &stru_1000694B8);
  return (id)qword_100088D80;
}

- (LUISchoolManager)init
{
  void *v3;
  void *v4;
  LUISchoolManager *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContainerSupport sharedInstance](LUIContainerSupport, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "classRosterInformationFileURL"));
  v5 = -[LUISchoolManager initWithURL:](self, "initWithURL:", v4);

  return v5;
}

- (LUISchoolManager)initWithDictionary:(id)a3
{
  id v4;
  LUISchoolManager *v5;
  LUISchoolManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LUISchoolManager;
  v5 = -[LUISchoolManager init](&v8, "init");
  v6 = v5;
  if (v5)
    -[LUISchoolManager setClassConfigurationForDictionary:](v5, "setClassConfigurationForDictionary:", v4);

  return v6;
}

- (LUISchoolManager)initWithURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  LUISchoolManager *v7;

  v4 = a3;
  if (!v4
    || (v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:", v4))) == 0)
  {
    v5 = objc_alloc_init((Class)NSDictionary);
  }
  v6 = v5;
  v7 = -[LUISchoolManager initWithDictionary:](self, "initWithDictionary:", v5);

  return v7;
}

- (BOOL)hasClasses
{
  NSArray *classes;

  classes = self->_classes;
  if (classes)
    LOBYTE(classes) = -[NSArray count](classes, "count") != 0;
  return (char)classes;
}

- (BOOL)hasStudents
{
  NSArray *students;

  students = self->_students;
  if (students)
    LOBYTE(students) = -[NSArray count](students, "count") != 0;
  return (char)students;
}

- (void)setClassConfiguration:(id)a3
{
  LKClassConfiguration *v5;
  NSArray *v6;
  NSArray *classes;
  NSString *v8;
  NSString *schoolName;
  NSArray *v10;
  NSArray *students;
  NSArray *v12;
  NSString *v13;
  void *v14;
  LKClassConfiguration *v15;

  v5 = (LKClassConfiguration *)a3;
  if (self->_classConfiguration != v5)
  {
    v15 = v5;
    objc_storeStrong((id *)&self->_classConfiguration, a3);
    if (v15)
    {
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue(-[LKClassConfiguration classes](self->_classConfiguration, "classes"));
      classes = self->_classes;
      self->_classes = v6;

      v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[LKClassConfiguration schoolName](self->_classConfiguration, "schoolName"));
      schoolName = self->_schoolName;
      self->_schoolName = v8;

      v10 = (NSArray *)objc_claimAutoreleasedReturnValue(-[LKClassConfiguration students](self->_classConfiguration, "students"));
      students = self->_students;
      self->_students = v10;
    }
    else
    {
      v12 = self->_classes;
      self->_classes = 0;

      v13 = self->_schoolName;
      self->_schoolName = 0;

      students = self->_students;
      self->_students = 0;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[LUIContactCache sharedInstance](LUIContactCache, "sharedInstance"));
    objc_msgSend(v14, "deleteContactCache");

    v5 = v15;
  }

}

- (void)setClassConfigurationForDictionary:(id)a3
{
  id v4;
  LKClassConfiguration *v5;
  LKClassConfiguration *classConfiguration;
  NSArray *v7;
  NSArray *classes;
  NSString *v9;
  NSString *schoolName;
  NSArray *v11;
  NSArray *students;

  v4 = a3;
  v5 = (LKClassConfiguration *)objc_msgSend(objc_alloc((Class)LKClassConfiguration), "initWithDictionary:", v4);

  classConfiguration = self->_classConfiguration;
  self->_classConfiguration = v5;

  v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[LKClassConfiguration classes](self->_classConfiguration, "classes"));
  classes = self->_classes;
  self->_classes = v7;

  v9 = (NSString *)objc_claimAutoreleasedReturnValue(-[LKClassConfiguration schoolName](self->_classConfiguration, "schoolName"));
  schoolName = self->_schoolName;
  self->_schoolName = v9;

  v11 = (NSArray *)objc_claimAutoreleasedReturnValue(-[LKClassConfiguration students](self->_classConfiguration, "students"));
  students = self->_students;
  self->_students = v11;

}

- (id)payloadCertificatePersistentID
{
  LKClassConfiguration *classConfiguration;
  void *v4;

  classConfiguration = self->_classConfiguration;
  if (classConfiguration)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LKClassConfiguration payloadCertificatePersistentID](classConfiguration, "payloadCertificatePersistentID"));

    if (v4)
      classConfiguration = (LKClassConfiguration *)objc_claimAutoreleasedReturnValue(-[LKClassConfiguration payloadCertificatePersistentID](self->_classConfiguration, "payloadCertificatePersistentID"));
    else
      classConfiguration = 0;
  }
  return classConfiguration;
}

- (id)classInfoForClassID:(id)a3
{
  return -[LKClassConfiguration classInfoForClassID:](self->_classConfiguration, "classInfoForClassID:", a3);
}

- (id)studentForStudentIdentifier:(id)a3 inClass:(id)a4
{
  return -[LKClassConfiguration studentForStudentIdentifier:inClass:](self->_classConfiguration, "studentForStudentIdentifier:inClass:", a3, a4);
}

- (id)studentForStudentIdentifier:(id)a3
{
  return -[LKClassConfiguration studentForStudentIdentifier:](self->_classConfiguration, "studentForStudentIdentifier:", a3);
}

- (id)studentForUsername:(id)a3 inClass:(id)a4
{
  return -[LKClassConfiguration studentForUsername:inClass:](self->_classConfiguration, "studentForUsername:inClass:", a3, a4);
}

- (id)studentForUsername:(id)a3
{
  return -[LKClassConfiguration studentForUsername:](self->_classConfiguration, "studentForUsername:", a3);
}

- (id)classGroupsDictionary
{
  return -[LKClassConfiguration classesByClassGroupNameDictionary](self->_classConfiguration, "classesByClassGroupNameDictionary");
}

- (NSArray)classes
{
  return self->_classes;
}

- (NSArray)students
{
  return self->_students;
}

- (void)setStudents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)schoolName
{
  return self->_schoolName;
}

- (LKClassConfiguration)classConfiguration
{
  return self->_classConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classConfiguration, 0);
  objc_storeStrong((id *)&self->_schoolName, 0);
  objc_storeStrong((id *)&self->_students, 0);
  objc_storeStrong((id *)&self->_classes, 0);
}

@end
