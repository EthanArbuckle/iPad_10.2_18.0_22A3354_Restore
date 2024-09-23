@implementation _CNCombinedBufferingStrategy

- (_CNCombinedBufferingStrategy)initWithStrategies:(id)a3
{
  id v4;
  _CNCombinedBufferingStrategy *v5;
  uint64_t v6;
  NSArray *strategies;
  _CNCombinedBufferingStrategy *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNCombinedBufferingStrategy;
  v5 = -[_CNCombinedBufferingStrategy init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    strategies = v5->_strategies;
    v5->_strategies = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)eachStrategy:(id)a3
{
  -[NSArray _cn_each:](self->_strategies, "_cn_each:", a3);
}

- (void)buffer:(id)a3 didReceiveResults:(id)a4 forObserver:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69___CNCombinedBufferingStrategy_buffer_didReceiveResults_forObserver___block_invoke;
  v14[3] = &unk_1E29BC8D0;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[_CNCombinedBufferingStrategy eachStrategy:](self, "eachStrategy:", v14);

}

- (void)bufferDidSendResults:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53___CNCombinedBufferingStrategy_bufferDidSendResults___block_invoke;
  v6[3] = &unk_1E29BC8F8;
  v7 = v4;
  v5 = v4;
  -[_CNCombinedBufferingStrategy eachStrategy:](self, "eachStrategy:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategies, 0);
}

@end
