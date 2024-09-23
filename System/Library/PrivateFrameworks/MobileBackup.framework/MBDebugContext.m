@implementation MBDebugContext

+ (id)defaultDebugContext
{
  return objc_alloc_init(MBDebugContext);
}

- (MBDebugContext)init
{
  MBDebugContext *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MBDebugContext;
  v2 = -[MBDebugContext init](&v4, sel_init);
  if (v2)
    v2->_dictionary = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", MBDefaultDebugContext());
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBDebugContext;
  -[MBDebugContext dealloc](&v3, sel_dealloc);
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_dictionary, "copy");
}

- (int64_t)time
{
  NSDate *v2;
  double v3;

  v2 = -[MBDebugContext simulatedDate](self, "simulatedDate");
  if (!v2)
    return time(0);
  -[NSDate timeIntervalSince1970](v2, "timeIntervalSince1970");
  return (uint64_t)v3;
}

- (NSDate)simulatedDate
{
  return (NSDate *)-[MBDebugContext valueForName:](self, "valueForName:", CFSTR("SimulatedSystemDate"));
}

- (void)setSimulatedDate:(id)a3
{
  if (a3)
    -[MBDebugContext setValue:forName:](self, "setValue:forName:", a3, CFSTR("SimulatedSystemDate"));
  else
    -[MBDebugContext removeValueForName:](self, "removeValueForName:", CFSTR("SimulatedSystemDate"));
}

- (BOOL)isFlagSet:(id)a3
{
  NSMutableDictionary *dictionary;

  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  LOBYTE(a3) = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", a3), "BOOLValue");
  objc_sync_exit(dictionary);
  return (char)a3;
}

- (void)setFlag:(id)a3
{
  NSMutableDictionary *dictionary;

  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dictionary, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], a3);
  objc_sync_exit(dictionary);
}

- (void)setValue:(id)a3 forName:(id)a4
{
  NSMutableDictionary *dictionary;

  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dictionary, "setObject:forKeyedSubscript:", a3, a4);
  objc_sync_exit(dictionary);
}

- (void)removeValueForName:(id)a3
{
  NSMutableDictionary *dictionary;

  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  -[NSMutableDictionary removeObjectForKey:](self->_dictionary, "removeObjectForKey:", a3);
  objc_sync_exit(dictionary);
}

- (id)valueForName:(id)a3
{
  NSMutableDictionary *dictionary;
  void *v6;

  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", a3);
  objc_sync_exit(dictionary);
  return v6;
}

- (void)setBool:(BOOL)a3 forName:(id)a4
{
  _BOOL8 v5;
  NSMutableDictionary *dictionary;

  v5 = a3;
  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dictionary, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5), a4);
  objc_sync_exit(dictionary);
}

- (BOOL)BOOLForName:(id)a3
{
  NSMutableDictionary *dictionary;

  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  LOBYTE(a3) = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", a3), "BOOLValue");
  objc_sync_exit(dictionary);
  return (char)a3;
}

- (void)setInt:(int)a3 forName:(id)a4
{
  -[MBDebugContext setValue:forName:](self, "setValue:forName:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3), a4);
}

- (int)intForName:(id)a3
{
  return objc_msgSend(-[MBDebugContext valueForName:](self, "valueForName:", a3), "intValue");
}

- (void)setDelegate:(id)a3 andSelector:(SEL)a4 forName:(id)a5
{
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v7[0] = a3;
  v7[1] = NSStringFromSelector(a4);
  -[MBDebugContext setValue:forName:](self, "setValue:forName:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2), a5);
}

- (id)performSelectorForName:(id)a3
{
  id result;

  result = -[MBDebugContext valueForName:](self, "valueForName:", a3);
  if (result)
    return (id)objc_msgSend((id)objc_msgSend(result, "objectAtIndexedSubscript:", 0), "performSelector:", NSSelectorFromString((NSString *)objc_msgSend(result, "objectAtIndexedSubscript:", 1)));
  return result;
}

- (id)performSelectorForName:(id)a3 withObject:(id)a4
{
  id result;

  result = -[MBDebugContext valueForName:](self, "valueForName:", a3);
  if (result)
    return (id)objc_msgSend((id)objc_msgSend(result, "objectAtIndexedSubscript:", 0), "performSelector:withObject:", NSSelectorFromString((NSString *)objc_msgSend(result, "objectAtIndexedSubscript:", 1)), a4);
  return result;
}

- (id)description
{
  NSMutableDictionary *dictionary;
  void *v4;

  dictionary = self->_dictionary;
  objc_sync_enter(dictionary);
  v4 = MBStringWithDictionary(self->_dictionary);
  objc_sync_exit(dictionary);
  return v4;
}

@end
