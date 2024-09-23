@implementation GEOAPShowEvalHandler

- (void)visit
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  GEOGetGEOAPRemoteAnalyticsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[GEOAPShowEvalHandler visit]";
    _os_log_impl(&dword_23CBB4000, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[NSXPCConnection remoteObjectProxy](self->_xpcConn, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showEvalData");

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_wait, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)evalData:(id)a3 ofType:(unint64_t)a4 createTime:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a3;
  GEOGetGEOAPShowEvalHandlerAnalyticsLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 136315138;
    v11 = "-[GEOAPShowEvalHandler evalData:ofType:createTime:]";
    _os_log_impl(&dword_23CBB4000, v9, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v10, 0xCu);
  }

  (*((void (**)(void))self->_visitorBlock + 2))();
}

- (void)endEvalData
{
  NSXPCConnection *xpcConn;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_wait);
  -[NSXPCConnection invalidate](self->_xpcConn, "invalidate");
  xpcConn = self->_xpcConn;
  self->_xpcConn = 0;

}

- (void)stream
{
  id v2;

  -[NSXPCConnection remoteObjectProxy](self->_xpcConn, "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamEvalData");

}

- (void)logMsg:(id)a3
{
  (*((void (**)(void))self->_streamLogMsgBlock + 2))();
}

- (void)dailyUsageActionType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6
{
  (*((void (**)(void))self->_streamDailyUsageBlock + 2))();
}

- (void)monthlyUsageActionType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6
{
  (*((void (**)(void))self->_streamMonthlyUsageBlock + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_streamMonthlyUsageBlock, 0);
  objc_storeStrong(&self->_streamDailyUsageBlock, 0);
  objc_storeStrong(&self->_streamLogMsgBlock, 0);
  objc_storeStrong((id *)&self->_wait, 0);
  objc_storeStrong(&self->_visitorBlock, 0);
  objc_storeStrong((id *)&self->_xpcConn, 0);
}

@end
