@implementation CalDAVMultiPutTask

- (CalDAVMultiPutTask)initWithURL:(id)a3 checkCTag:(id)a4 uuidsToAddActions:(id)a5 hrefsToModDeleteActions:(id)a6
{
  id v10;
  id v11;
  CalDAVMultiPutTask *v12;
  CalDAVMultiPutTask *v13;
  objc_super v15;

  v10 = a5;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CalDAVMultiPutTask;
  v12 = -[CoreDAVMultiPutTask initWithURL:checkCTag:uuidsToAddActions:hrefsToModDeleteActions:](&v15, sel_initWithURL_checkCTag_uuidsToAddActions_hrefsToModDeleteActions_, a3, a4, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)((char *)&v12->super.super.super.isa + (int)*MEMORY[0x24BE1AC68]), (id)*MEMORY[0x24BE1ACF8]);
    objc_storeStrong((id *)((char *)&v13->super.super.super.isa + (int)*MEMORY[0x24BE1AC60]), CFSTR("calendar-data"));
  }
  -[CoreDAVMultiPutTask fillOutDataWithUUIDsToAddActions:hrefsToModDeleteActions:](v13, "fillOutDataWithUUIDsToAddActions:hrefsToModDeleteActions:", v10, v11);

  return v13;
}

@end
