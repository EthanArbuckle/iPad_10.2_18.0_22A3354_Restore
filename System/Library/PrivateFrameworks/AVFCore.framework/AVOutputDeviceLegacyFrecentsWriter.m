@implementation AVOutputDeviceLegacyFrecentsWriter

+ (id)defaultFrecentsWriter
{
  return objc_alloc_init((Class)a1);
}

- (AVOutputDeviceLegacyFrecentsWriter)init
{
  AVOutputDeviceLegacyFrecentsWriter *v2;
  AVOutputDeviceLegacyFrecentsWriter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVOutputDeviceLegacyFrecentsWriter;
  v2 = -[AVOutputDeviceLegacyFrecentsWriter init](&v5, sel_init);
  if (v2)
  {
    v2->_updatedFrecentsList = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_keysToRemove = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceLegacyFrecentsWriter;
  -[AVOutputDeviceLegacyFrecentsWriter dealloc](&v3, sel_dealloc);
}

- (void)setFrecencyInfo:(id)a3 forDeviceID:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_updatedFrecentsList, "setObject:forKeyedSubscript:", a3, a4);
}

- (int64_t)numberOfKeysToBeSet
{
  return -[NSMutableDictionary count](self->_updatedFrecentsList, "count");
}

- (void)removeFrecencyInfoForDeviceID:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_updatedFrecentsList, "removeObjectForKey:");
  -[NSMutableArray addObject:](self->_keysToRemove, "addObject:", a3);
}

- (BOOL)persistToDiskReturningError:(id *)a3
{
  int v4;

  CFPreferencesSetMultiple((CFDictionaryRef)self->_updatedFrecentsList, (CFArrayRef)self->_keysToRemove, CFSTR("com.apple.avfoundation.frecents"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v4 = CFPreferencesAppSynchronize(CFSTR("com.apple.avfoundation.frecents"));
  -[NSMutableDictionary removeAllObjects](self->_updatedFrecentsList, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_keysToRemove, "removeAllObjects");
  return v4 != 0;
}

@end
