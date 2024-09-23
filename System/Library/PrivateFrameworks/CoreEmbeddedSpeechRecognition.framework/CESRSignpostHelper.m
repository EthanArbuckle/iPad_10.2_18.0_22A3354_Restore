@implementation CESRSignpostHelper

- (CESRSignpostHelper)init
{
  CESRSignpostHelper *v2;
  uint64_t v3;
  NSMutableDictionary *eventNameToId;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CESRSignpostHelper;
  v2 = -[CESRSignpostHelper init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    eventNameToId = v2->_eventNameToId;
    v2->_eventNameToId = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)storeSignpostId:(unint64_t)a3 forEventName:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_eventNameToId, "setObject:forKey:", v8, v7);

}

- (unint64_t)fetchAndDestroySignpostIdForEventName:(id)a3
{
  NSMutableDictionary *eventNameToId;
  id v5;
  void *v6;
  unint64_t v7;

  eventNameToId = self->_eventNameToId;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](eventNameToId, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_eventNameToId, "removeObjectForKey:", v5);

  v7 = objc_msgSend(v6, "unsignedLongLongValue");
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventNameToId, 0);
}

@end
