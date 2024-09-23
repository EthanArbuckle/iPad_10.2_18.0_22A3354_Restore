@implementation DYTimelineCounterGroup

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYTimelineCounterGroup timestamps](self, "timestamps"));
  v6 = objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTimestamps:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYTimelineCounterGroup counters](self, "counters"));
  v8 = objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setCounters:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYTimelineCounterGroup counterNames](self, "counterNames"));
  v10 = objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setCounterNames:", v10);

  return v4;
}

- (DYTimelineCounterGroup)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  DYTimelineCounterGroup *v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  uint64_t v11;
  NSData *timestamps;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSSet *v22;
  void *v23;
  uint64_t v24;
  NSArray *counters;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSSet *v31;
  void *v32;
  uint64_t v33;
  NSArray *counterNames;
  DYTimelineCounterGroup *v35;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)DYTimelineCounterGroup;
  v6 = -[DYTimelineCounterGroup init](&v37, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSData, v5);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(NSMutableData, v8), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("timestamps")));
    timestamps = v6->_timestamps;
    v6->_timestamps = (NSData *)v11;

    v14 = objc_opt_class(NSData, v13);
    v16 = objc_opt_class(NSMutableData, v15);
    v18 = objc_opt_class(NSArray, v17);
    v20 = objc_opt_class(NSNumber, v19);
    v22 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, v16, v18, v20, objc_opt_class(NSMutableArray, v21), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("counters")));
    counters = v6->_counters;
    v6->_counters = (NSArray *)v24;

    v27 = objc_opt_class(NSArray, v26);
    v29 = objc_opt_class(NSString, v28);
    v31 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v27, v29, objc_opt_class(NSMutableArray, v30), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("countersNames")));
    counterNames = v6->_counterNames;
    v6->_counterNames = (NSArray *)v33;

    v35 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_timestamps, CFSTR("timestamps"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_counters, CFSTR("counters"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_counterNames, CFSTR("countersNames"));

}

- (DYTimelineCounterGroup)init
{
  DYTimelineCounterGroup *v2;
  DYTimelineCounterGroup *v3;
  DYTimelineCounterGroup *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DYTimelineCounterGroup;
  v2 = -[DYTimelineCounterGroup init](&v6, "init");
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (NSData)timestamps
{
  return self->_timestamps;
}

- (void)setTimestamps:(id)a3
{
  objc_storeStrong((id *)&self->_timestamps, a3);
}

- (NSArray)counters
{
  return self->_counters;
}

- (void)setCounters:(id)a3
{
  objc_storeStrong((id *)&self->_counters, a3);
}

- (NSArray)counterNames
{
  return self->_counterNames;
}

- (void)setCounterNames:(id)a3
{
  objc_storeStrong((id *)&self->_counterNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterNames, 0);
  objc_storeStrong((id *)&self->_counters, 0);
  objc_storeStrong((id *)&self->_timestamps, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
