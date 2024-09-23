@implementation _MKFeedbackReportTicket

- (_MKFeedbackReportTicket)initWithFeedbackReportTicket:(id)a3
{
  id v5;
  _MKFeedbackReportTicket *v6;
  _MKFeedbackReportTicket *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MKFeedbackReportTicket;
  v6 = -[_MKFeedbackReportTicket init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ticket, a3);

  return v7;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  -[_MKFeedbackReportTicket submitWithCallbackQueue:handler:networkActivity:](self, "submitWithCallbackQueue:handler:networkActivity:", MEMORY[0x1E0C80D38], a3, a4);
}

- (void)submitWithCallbackQueue:(id)a3 handler:(id)a4 networkActivity:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  GEOMapServiceFeedbackReportTicket *ticket;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  ticket = self->_ticket;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke;
  v19[3] = &unk_1E20DAAD0;
  v21 = v9;
  v20 = v8;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __75___MKFeedbackReportTicket_submitWithCallbackQueue_handler_networkActivity___block_invoke_3;
  v16[3] = &unk_1E20DAB20;
  v17 = v20;
  v18 = v10;
  v13 = v20;
  v14 = v10;
  v15 = v9;
  -[GEOMapServiceFeedbackReportTicket submitWithHandler:networkActivity:](ticket, "submitWithHandler:networkActivity:", v19, v16);

}

- (void)cancel
{
  -[GEOMapServiceFeedbackReportTicket cancel](self->_ticket, "cancel");
}

- (GEOMapServiceTraits)traits
{
  return (GEOMapServiceTraits *)-[GEOMapServiceFeedbackReportTicket traits](self->_ticket, "traits");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
