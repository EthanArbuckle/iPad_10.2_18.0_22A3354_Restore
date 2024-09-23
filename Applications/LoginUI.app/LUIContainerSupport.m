@implementation LUIContainerSupport

+ (id)sharedInstance
{
  if (qword_100088E80 != -1)
    dispatch_once(&qword_100088E80, &stru_100069CE0);
  return (id)qword_100088E78;
}

- (LKClassConfiguration)cachedClassConfiguration
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContainerSupport classRosterInformationFileURL](self, "classRosterInformationFileURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v2));

  if (v3)
  {
    v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(LKClassConfiguration), v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v5 = 0;
  }

  return (LKClassConfiguration *)v5;
}

- (id)containerLibraryDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLsForDirectory:inDomains:", 5, 1));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));
  return v4;
}

- (NSURL)classRosterInformationFileURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIContainerSupport containerLibraryDirectoryURL](self, "containerLibraryDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("LoginUI/Roster")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "absoluteString"));
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if ((v6 & 1) == 0
    && (objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0) & 1) == 0)
  {
    v7 = (void *)qword_100088F08;
    if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEBUG))
      sub_10003C948(v7, v3);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("ClassRoster.plist")));
  v9 = (void *)qword_100088F08;
  if (os_log_type_enabled((os_log_t)qword_100088F08, OS_LOG_TYPE_DEBUG))
    sub_10003C8BC(v9, v8);

  return (NSURL *)v8;
}

@end
