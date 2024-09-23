@implementation VCMediaRecorderManagerStreamTokenClientList

- (VCMediaRecorderManagerStreamTokenClientList)initWithStreamToken:(int64_t)a3 mediaRecorder:(id)a4
{
  VCMediaRecorderManagerStreamTokenClientList *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCMediaRecorderManagerStreamTokenClientList;
  v6 = -[VCMediaRecorderManagerStreamTokenClientList init](&v8, sel_init);
  if (v6)
  {
    v6->_clientContextList = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6->_streamToken = a3;
    v6->_mediaRecorder = (VCMediaRecorderProtocol *)a4;
  }
  return v6;
}

- (id)newContext
{
  VCMomentsClientContext *v3;

  v3 = -[VCMomentsClientContext initWithStreamToken:]([VCMomentsClientContext alloc], "initWithStreamToken:", self->_streamToken);
  -[NSMutableArray addObject:](self->_clientContextList, "addObject:", v3);
  return v3;
}

- (void)removeContext:(id)a3
{
  -[NSMutableArray removeObject:](self->_clientContextList, "removeObject:", a3);
}

+ (BOOL)isValidContext:(id)a3
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

+ (int64_t)streamTokenFromClientContext:(id)a3
{
  return objc_msgSend(a3, "streamToken");
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaRecorderManagerStreamTokenClientList;
  -[VCMediaRecorderManagerStreamTokenClientList dealloc](&v3, sel_dealloc);
}

- (VCMediaRecorderProtocol)mediaRecorder
{
  return self->_mediaRecorder;
}

- (NSArray)clientContextList
{
  return &self->_clientContextList->super;
}

@end
