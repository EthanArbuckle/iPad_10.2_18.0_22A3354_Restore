@implementation ICNAViewController

- (ICNAEventReporter)eventReporter
{
  void *v3;
  ICNAEventReporter *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  ICNAEventReporter *v8;
  ICNAEventReporter *eventReporter;
  void *v10;

  if (!self->_eventReporter)
  {
    if (+[ICNAOptedInObject isOptedInForAnalytics](ICNAEventReporter, "isOptedInForAnalytics"))
    {
      -[ICNAViewController viewForEventReporterIfLoaded](self, "viewForEventReporterIfLoaded");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        v4 = [ICNAEventReporter alloc];
        v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICNAViewController viewForEventReporter](self, "viewForEventReporter");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[ICNAEventReporter initWithSubTrackerName:view:](v4, "initWithSubTrackerName:view:", v6, v7);
        eventReporter = self->_eventReporter;
        self->_eventReporter = v8;

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_eventReporterLostSession_, CFSTR("ICNAEventReporterLostSessionNotification"), self->_eventReporter);

      }
    }
  }
  return self->_eventReporter;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[ICNAViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ICNAViewController eventReporter](self, "eventReporter");

  }
  v7.receiver = self;
  v7.super_class = (Class)ICNAViewController;
  -[ICNAViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICNAViewController;
  -[ICNAViewController dealloc](&v4, sel_dealloc);
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  void *v6;
  id v7;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("ICNAEventReporterLostSessionNotification"), v6);
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end
