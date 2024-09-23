@implementation AVCapturePreparedPhotoSettingsArrayRequest

- (unint64_t)requestID
{
  return self->_requestID;
}

- (NSArray)photoSettingsArray
{
  return self->_photoSettingsArray;
}

+ (id)preparedPhotoSettingsArrayRequestWithArray:(id)a3 completionHandler:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithArray:completionHandler:", a3, a4);
}

- (id)_initWithArray:(id)a3 completionHandler:(id)a4
{
  AVCapturePreparedPhotoSettingsArrayRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCapturePreparedPhotoSettingsArrayRequest;
  v6 = -[AVCapturePreparedPhotoSettingsArrayRequest init](&v8, sel_init);
  if (v6)
  {
    v6->_requestID = +[AVCapturePhotoSettings uniqueID](AVCapturePhotoSettings, "uniqueID");
    v6->_photoSettingsArray = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", a3, 1);
    v6->_completionHandler = (id)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCapturePreparedPhotoSettingsArrayRequest;
  -[AVCapturePreparedPhotoSettingsArrayRequest dealloc](&v3, sel_dealloc);
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)_setRequestID:(unint64_t)a3
{
  self->_requestID = a3;
}

@end
