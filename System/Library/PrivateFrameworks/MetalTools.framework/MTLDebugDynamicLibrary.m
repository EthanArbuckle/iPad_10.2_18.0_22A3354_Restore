@implementation MTLDebugDynamicLibrary

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  objc_super v8;

  if (!a3)
    MTLReportFailure();
  if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
    MTLReportFailure();
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugDynamicLibrary;
  return -[MTLToolsDynamicLibrary serializeToURL:error:](&v8, sel_serializeToURL_error_, a3, a4);
}

- (BOOL)serializeToURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  objc_super v10;

  if (!a3)
    MTLReportFailure();
  if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
    MTLReportFailure();
  v10.receiver = self;
  v10.super_class = (Class)MTLDebugDynamicLibrary;
  return -[MTLToolsDynamicLibrary serializeToURL:options:error:](&v10, sel_serializeToURL_options_error_, a3, a4, a5);
}

@end
