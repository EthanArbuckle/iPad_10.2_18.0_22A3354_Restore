@implementation AXEventHandInfoRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXEventHandInfoRepresentation *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(AXEventHandInfoRepresentation);
  -[AXEventHandInfoRepresentation setEventType:](v4, "setEventType:", -[AXEventHandInfoRepresentation eventType](self, "eventType"));
  -[AXEventHandInfoRepresentation setInitialFingerCount:](v4, "setInitialFingerCount:", -[AXEventHandInfoRepresentation initialFingerCount](self, "initialFingerCount"));
  -[AXEventHandInfoRepresentation setCurrentFingerCount:](v4, "setCurrentFingerCount:", -[AXEventHandInfoRepresentation currentFingerCount](self, "currentFingerCount"));
  -[AXEventHandInfoRepresentation setLifetimeFingerCount:](v4, "setLifetimeFingerCount:", -[AXEventHandInfoRepresentation lifetimeFingerCount](self, "lifetimeFingerCount"));
  -[AXEventHandInfoRepresentation setSwipe:](v4, "setSwipe:", -[AXEventHandInfoRepresentation swipe](self, "swipe"));
  -[AXEventHandInfoRepresentation setSystemGesturePossible:](v4, "setSystemGesturePossible:", -[AXEventHandInfoRepresentation systemGesturePossible](self, "systemGesturePossible"));
  v5 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[AXEventHandInfoRepresentation paths](self, "paths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:copyItems:", v6, 1);

  -[AXEventHandInfoRepresentation setPaths:](v4, "setPaths:", v7);
  -[AXEventHandInfoRepresentation setHandIdentity:](v4, "setHandIdentity:", -[AXEventHandInfoRepresentation handIdentity](self, "handIdentity"));
  -[AXEventHandInfoRepresentation handPosition](self, "handPosition");
  -[AXEventHandInfoRepresentation setHandPosition:](v4, "setHandPosition:");
  -[AXEventHandInfoRepresentation setHandIndex:](v4, "setHandIndex:", -[AXEventHandInfoRepresentation handIndex](self, "handIndex"));
  -[AXEventHandInfoRepresentation setHandEventMask:](v4, "setHandEventMask:", -[AXEventHandInfoRepresentation handEventMask](self, "handEventMask"));

  return v4;
}

- (AXEventHandInfoRepresentation)initWithCoder:(id)a3
{
  id v4;
  AXEventHandInfoRepresentation *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *paths;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXEventHandInfoRepresentation;
  v5 = -[AXEventHandInfoRepresentation init](&v13, sel_init);
  if (v5)
  {
    v5->_eventType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("eventType"));
    v5->_initialFingerCount = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("initialFingerCount"));
    v5->_currentFingerCount = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("currentFingerCount"));
    v5->_lifetimeFingerCount = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("lifetimeFingerCount"));
    v5->_swipe = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("swipe"));
    v5->_systemGesturePossible = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("systemGesturePossible"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("paths"));
    v9 = objc_claimAutoreleasedReturnValue();
    paths = v5->_paths;
    v5->_paths = (NSArray *)v9;

    v5->_handIdentity = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("handIdentity"));
    v5->_handIndex = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("handIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handPosition"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getValue:size:", &v5->_handPosition, 16);

    v5->_handEventMask = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("handEventMask"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t eventType;
  void *v5;
  id v6;

  eventType = self->_eventType;
  v6 = a3;
  objc_msgSend(v6, "encodeInt32:forKey:", eventType, CFSTR("eventType"));
  objc_msgSend(v6, "encodeInt32:forKey:", self->_initialFingerCount, CFSTR("initialFingerCount"));
  objc_msgSend(v6, "encodeInt32:forKey:", self->_currentFingerCount, CFSTR("currentFingerCount"));
  objc_msgSend(v6, "encodeInt32:forKey:", self->_lifetimeFingerCount, CFSTR("lifetimeFingerCount"));
  objc_msgSend(v6, "encodeInt32:forKey:", self->_swipe, CFSTR("swipe"));
  objc_msgSend(v6, "encodeInt32:forKey:", self->_systemGesturePossible, CFSTR("systemGesturePossible"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_paths, CFSTR("paths"));
  objc_msgSend(v6, "encodeInt32:forKey:", self->_handIdentity, CFSTR("handIdentity"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_handPosition, "{CGPoint=dd}");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("handPosition"));

  objc_msgSend(v6, "encodeInt32:forKey:", self->_handIndex, CFSTR("handIndex"));
  objc_msgSend(v6, "encodeInt32:forKey:", self->_handEventMask, CFSTR("handEventMask"));

}

- (id)accessibilityEventRepresentationTabularDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  AXDebugDescriptionForAXHandEventType(-[AXEventHandInfoRepresentation eventType](self, "eventType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("  Hand Info\n    Type:                    %@\n    Initial Finger Count:    %i\n    Current Finger Count:    %i\n    Lifetime Finger Count:    %i\n    Swipe:                   %i\n    System Gesture Possible: %i\n"), v4, -[AXEventHandInfoRepresentation initialFingerCount](self, "initialFingerCount"), -[AXEventHandInfoRepresentation currentFingerCount](self, "currentFingerCount"), -[AXEventHandInfoRepresentation lifetimeFingerCount](self, "lifetimeFingerCount"), -[AXEventHandInfoRepresentation swipe](self, "swipe"), -[AXEventHandInfoRepresentation systemGesturePossible](self, "systemGesturePossible"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXEventHandInfoRepresentation paths](self, "paths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v5, "appendString:", CFSTR("    Hand Paths:\n"));
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[AXEventHandInfoRepresentation paths](self, "paths");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "accessibilityEventRepresentationTabularDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR("%@"), v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  return v5;
}

- (BOOL)isStylus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[AXEventHandInfoRepresentation paths](self, "paths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AXEventHandInfoRepresentation paths](self, "paths");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "transducerType") == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AXEventHandInfoRepresentation;
  -[AXEventHandInfoRepresentation description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXDebugDescriptionForAXHandEventType(-[AXEventHandInfoRepresentation eventType](self, "eventType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AXEventHandInfoRepresentation initialFingerCount](self, "initialFingerCount");
  v6 = -[AXEventHandInfoRepresentation currentFingerCount](self, "currentFingerCount");
  v7 = -[AXEventHandInfoRepresentation lifetimeFingerCount](self, "lifetimeFingerCount");
  v8 = -[AXEventHandInfoRepresentation swipe](self, "swipe");
  v9 = -[AXEventHandInfoRepresentation systemGesturePossible](self, "systemGesturePossible");
  v10 = -[AXEventHandInfoRepresentation isStylus](self, "isStylus");
  -[AXEventHandInfoRepresentation paths](self, "paths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - eventType %@, initialFingerCount %i, currentFingerCount %i, lifetimeFingerCount %i, swipe %i, systemGesturePossible %i, isStylus %i, \n\t\tpaths %@"), v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unsigned int)a3
{
  self->_eventType = a3;
}

- (unsigned)initialFingerCount
{
  return self->_initialFingerCount;
}

- (void)setInitialFingerCount:(unsigned __int16)a3
{
  self->_initialFingerCount = a3;
}

- (unsigned)currentFingerCount
{
  return self->_currentFingerCount;
}

- (void)setCurrentFingerCount:(unsigned __int16)a3
{
  self->_currentFingerCount = a3;
}

- (unsigned)lifetimeFingerCount
{
  return self->_lifetimeFingerCount;
}

- (void)setLifetimeFingerCount:(unsigned __int16)a3
{
  self->_lifetimeFingerCount = a3;
}

- (NSArray)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
{
  objc_storeStrong((id *)&self->_paths, a3);
}

- (unsigned)systemGesturePossible
{
  return self->_systemGesturePossible;
}

- (void)setSystemGesturePossible:(unsigned __int8)a3
{
  self->_systemGesturePossible = a3;
}

- (unsigned)handIdentity
{
  return self->_handIdentity;
}

- (void)setHandIdentity:(unsigned int)a3
{
  self->_handIdentity = a3;
}

- (unsigned)handIndex
{
  return self->_handIndex;
}

- (void)setHandIndex:(unsigned int)a3
{
  self->_handIndex = a3;
}

- (CGPoint)handPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_handPosition.x;
  y = self->_handPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setHandPosition:(CGPoint)a3
{
  self->_handPosition = a3;
}

- (unsigned)handEventMask
{
  return self->_handEventMask;
}

- (void)setHandEventMask:(unsigned int)a3
{
  self->_handEventMask = a3;
}

- (unsigned)additionalHandEventFlagsForGeneratedEvents
{
  return self->_additionalHandEventFlagsForGeneratedEvents;
}

- (void)setAdditionalHandEventFlagsForGeneratedEvents:(unsigned int)a3
{
  self->_additionalHandEventFlagsForGeneratedEvents = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (unsigned)swipe
{
  return self->_swipe;
}

- (void)setSwipe:(unsigned __int8)a3
{
  self->_swipe = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
