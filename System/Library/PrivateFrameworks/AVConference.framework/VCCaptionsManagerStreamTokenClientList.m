@implementation VCCaptionsManagerStreamTokenClientList

- (VCCaptionsManagerStreamTokenClientList)initWithStreamToken:(int64_t)a3 captionsSource:(id)a4
{
  VCCaptionsManagerStreamTokenClientList *v6;
  NSMutableArray *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCCaptionsManagerStreamTokenClientList;
  v6 = -[VCCaptionsManagerStreamTokenClientList init](&v9, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6->_captionsSource = (VCCaptionsSource *)a4;
    v6->_clientContextList = v7;
    v6->_streamToken = a3;
  }
  return v6;
}

- (id)newContext
{
  VCCaptionsClientContext *v3;

  v3 = -[VCCaptionsClientContext initWithStreamToken:]([VCCaptionsClientContext alloc], "initWithStreamToken:", self->_streamToken);
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
  v3.super_class = (Class)VCCaptionsManagerStreamTokenClientList;
  -[VCCaptionsManagerStreamTokenClientList dealloc](&v3, sel_dealloc);
}

- (VCCaptionsSource)captionsSource
{
  return self->_captionsSource;
}

- (NSArray)clientContextList
{
  return &self->_clientContextList->super;
}

@end
