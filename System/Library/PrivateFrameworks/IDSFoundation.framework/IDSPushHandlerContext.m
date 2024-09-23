@implementation IDSPushHandlerContext

- (NSSet)wakingTopics
{
  return self->_wakingTopics;
}

- (NSSet)opportunisticTopics
{
  return self->_opportunisticTopics;
}

- (NSSet)nonWakingTopics
{
  return self->_nonWakingTopics;
}

- (void)setCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)commands
{
  return self->_commands;
}

- (IDSPushHandlerContext)initWithQueue:(id)a3 wakingTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6 commands:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  IDSPushHandlerContext *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  IDSPushHandlerContext *v22;
  uint64_t v23;
  NSSet *wakingTopics;
  const char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  NSSet *opportunisticTopics;
  const char *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  NSSet *nonWakingTopics;
  const char *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  NSSet *commands;
  objc_super v41;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v41.receiver = self;
  v41.super_class = (Class)IDSPushHandlerContext;
  v18 = -[IDSPushHandlerContext init](&v41, sel_init);
  v22 = v18;
  if (v18)
  {
    if (v13)
      objc_storeStrong((id *)&v18->_queue, a3);
    v23 = objc_msgSend_copy(v14, v19, v20, v21);
    wakingTopics = v22->_wakingTopics;
    v22->_wakingTopics = (NSSet *)v23;

    v28 = objc_msgSend_copy(v15, v25, v26, v27);
    opportunisticTopics = v22->_opportunisticTopics;
    v22->_opportunisticTopics = (NSSet *)v28;

    v33 = objc_msgSend_copy(v16, v30, v31, v32);
    nonWakingTopics = v22->_nonWakingTopics;
    v22->_nonWakingTopics = (NSSet *)v33;

    v38 = objc_msgSend_copy(v17, v35, v36, v37);
    commands = v22->_commands;
    v22->_commands = (NSSet *)v38;

  }
  return v22;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setWakingTopics:(id)a3
{
  objc_storeStrong((id *)&self->_wakingTopics, a3);
}

- (void)setOpportunisticTopics:(id)a3
{
  objc_storeStrong((id *)&self->_opportunisticTopics, a3);
}

- (void)setNonWakingTopics:(id)a3
{
  objc_storeStrong((id *)&self->_nonWakingTopics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonWakingTopics, 0);
  objc_storeStrong((id *)&self->_opportunisticTopics, 0);
  objc_storeStrong((id *)&self->_wakingTopics, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
