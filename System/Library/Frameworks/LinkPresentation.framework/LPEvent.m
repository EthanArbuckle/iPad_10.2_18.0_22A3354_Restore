@implementation LPEvent

- (LPEvent)init
{

  return 0;
}

- (LPEvent)initWithType:(int64_t)a3 subtitle:(id)a4
{
  id v7;
  LPEvent *v8;
  LPEvent *v9;
  LPEvent *v10;
  NSMutableArray *v11;
  NSMutableArray *children;
  LPEvent *v13;
  objc_super v15;

  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LPEvent;
  v8 = -[LPEvent init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    objc_sync_enter(v10);
    v10->_type = a3;
    objc_storeStrong((id *)&v10->_subtitle, a4);
    v10->_startTime = CACurrentMediaTime();
    v10->_status = 0;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    children = v10->_children;
    v10->_children = v11;

    v10->_specialization = 0;
    objc_sync_exit(v10);

    v13 = v10;
  }

  return v9;
}

- (id)childWithType:(int64_t)a3 subtitle:(id)a4
{
  id v6;
  LPEvent *v7;
  LPEvent *v8;

  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = -[LPEvent initWithType:subtitle:]([LPEvent alloc], "initWithType:subtitle:", a3, v6);
  -[NSMutableArray addObject:](v7->_children, "addObject:", v8);
  objc_storeWeak((id *)&v8->_parent, v7);
  objc_sync_exit(v7);

  return v8;
}

- (void)didCompleteWithErrorCode:(int64_t)a3
{
  uint64_t v3;

  if ((unint64_t)(a3 - 1) > 4)
    v3 = 1;
  else
    v3 = qword_1A0D65C60[a3 - 1];
  -[LPEvent didCompleteWithStatus:](self, "didCompleteWithStatus:", v3);
}

- (void)didCompleteWithStatus:(int64_t)a3
{
  LPEvent *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_status = a3;
  obj->_endTime = CACurrentMediaTime();
  +[LPStatistics recordEvent:](LPStatistics, "recordEvent:");
  objc_sync_exit(obj);

}

- (BOOL)_childrenAreComplete
{
  LPEvent *v2;
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = v2->_children;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isComplete", (_QWORD)v9) & 1) == 0)
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  objc_sync_exit(v2);
  return v7;
}

- (BOOL)isComplete
{
  LPEvent *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_status)
    v3 = -[LPEvent _childrenAreComplete](v2, "_childrenAreComplete");
  else
    v3 = 0;
  objc_sync_exit(v2);

  return v3;
}

- (double)duration
{
  LPEvent *v2;
  double v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_endTime - v2->_startTime;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (int64_t)status
{
  return self->_status;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (unint64_t)specialization
{
  return self->_specialization;
}

- (void)setSpecialization:(unint64_t)a3
{
  self->_specialization = a3;
}

- (LPEvent)parent
{
  return (LPEvent *)objc_loadWeakRetained((id *)&self->_parent);
}

- (NSArray)children
{
  return &self->_children->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
