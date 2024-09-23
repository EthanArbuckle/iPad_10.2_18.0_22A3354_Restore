@implementation AVOutputDeviceFrecentsWriter

- (AVOutputDeviceFrecentsWriter)init
{
  return -[AVOutputDeviceFrecentsWriter initWithFrecentsFilePath:](self, "initWithFrecentsFilePath:", 0);
}

- (AVOutputDeviceFrecentsWriter)initWithFrecentsFilePath:(id)a3
{
  AVOutputDeviceFrecentsWriter *v4;
  uint64_t v5;
  AVOutputDeviceFrecentsWriter *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVOutputDeviceFrecentsWriter;
  v4 = -[AVOutputDeviceFrecentsWriter init](&v8, sel_init);
  if (v4 && (v5 = objc_msgSend(a3, "copy"), (v4->_frecentsFilePath = (NSString *)v5) != 0))
  {
    v4->_frecents = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceFrecentsWriter;
  -[AVOutputDeviceFrecentsWriter dealloc](&v3, sel_dealloc);
}

- (void)setFrecencyInfo:(id)a3 forDeviceID:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_frecents, "setObject:forKeyedSubscript:", a3, a4);
}

- (int64_t)numberOfKeysToBeSet
{
  return -[NSMutableDictionary count](self->_frecents, "count");
}

- (void)removeFrecencyInfoForDeviceID:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_frecents, "removeObjectForKey:", a3);
}

- (BOOL)persistToDiskReturningError:(id *)a3
{
  uint64_t v5;
  void *v7;

  v7 = 0;
  v5 = objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_frecents, 200, 0, &v7);
  if (v5)
    LOBYTE(v5) = objc_msgSend((id)v5, "writeToFile:options:error:", self->_frecentsFilePath, 0, &v7);
  if (a3 && (v5 & 1) == 0)
    *a3 = v7;
  return v5;
}

@end
