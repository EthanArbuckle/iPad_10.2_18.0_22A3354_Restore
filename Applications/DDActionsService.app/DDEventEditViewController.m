@implementation DDEventEditViewController

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DDRemoteActionPresenter, a2, a1);
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___DDRemoteActionViewService, a2, a1);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  DDEventEditViewController *v4;

  v4 = self;
  v3 = a2;
  if (self->_eventEditViewController)
  {
    -[EKEventEditViewController dismissViewControllerAnimated:completion:](v4->_eventEditViewController, "dismissViewControllerAnimated:completion:", 0);
    objc_storeStrong((id *)&v4->_eventEditViewController, 0);
  }
  v2.receiver = v4;
  v2.super_class = (Class)DDEventEditViewController;
  -[DDEventEditViewController dealloc](&v2, "dealloc");
}

- (void)prepareForAction:(id)a3
{
  id v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(id *, char, id);
  void *v8;
  id v9;
  id v10;
  DDEventEditViewController *v11;
  id v12;
  id location[2];
  DDEventEditViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = objc_alloc_init((Class)EKEventStore);
  v3 = v12;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_100013C68;
  v8 = &unk_100020858;
  v9 = location[0];
  v10 = v12;
  v11 = v14;
  objc_msgSend(v3, "requestFullAccessToEventsWithCompletion:");
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)setCancellable:(BOOL)a3
{
  id v3;
  BOOL v4;

  v4 = a3;
  v3 = -[DDEventEditViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  objc_msgSend(v3, "actionCanBeCancelledExternally:", v4);

}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  unsigned int v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSString *v10;
  EKEvent *v11;
  id v12;
  uint64_t prefillMode;
  uint64_t eventTypeClassification;
  uint64_t proposedEvent;
  id v16;
  NSTimeZone *v17;
  id v18;
  id v19;
  BOOL v20;
  id v22;
  char v23;
  id v24;
  uint64_t v25;
  char v26;
  int64_t v27;
  id location[2];
  DDEventEditViewController *v29;
  uint8_t v30[56];

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = a4;
  v26 = 0;
  v25 = 2;
  if (a4 == 1)
  {
    v25 = 0;
    v26 = 1;
  }
  else if (!v27)
  {
    v25 = 1;
    v26 = 1;
  }
  v18 = objc_msgSend(location[0], "event");
  v19 = objc_msgSend(v18, "timeZone");
  v23 = 0;
  v20 = 0;
  if (v19)
  {
    v24 = -[EKEvent timeZone](v29->_proposedEvent, "timeZone");
    v23 = 1;
    v20 = v24 == 0;
  }
  if ((v23 & 1) != 0)

  if (v20)
  {
    v17 = +[NSTimeZone defaultTimeZone](NSTimeZone, "defaultTimeZone");
    -[EKEvent setTimeZone:](v29->_proposedEvent, "setTimeZone:");

  }
  if (v29->_shouldTrackEventCreation && (v26 & 1) != 0)
  {
    v22 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
    {
      prefillMode = v29->_prefillMode;
      eventTypeClassification = (uint64_t)v29->_eventTypeClassification;
      proposedEvent = (uint64_t)v29->_proposedEvent;
      v16 = objc_msgSend(location[0], "event");
      sub_100014F80((uint64_t)v30, v25, prefillMode, eventTypeClassification, proposedEvent, (uint64_t)v16);
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_DEBUG, "Will record user interaction %ld with prefill mode %ld and event type classification %@. Proposed event: %@, final event: %@ #DDUINLEventMetrics", v30, 0x34u);

    }
    objc_storeStrong(&v22, 0);
    v4 = -[DDAction hostApplication](v29->_action, "hostApplication");
    v5 = 2;
    if (v4 != 1)
      v5 = 3;
    v7 = v25;
    v8 = v5;
    v9 = v29->_prefillMode;
    v10 = v29->_eventTypeClassification;
    v11 = v29->_proposedEvent;
    v12 = objc_msgSend(location[0], "event");
    +[SGNLEventSuggestionsMetrics recordUserInteraction:withLinkInApplication:eventPrefillMode:eventTypeClassification:proposedEvent:confirmedEvent:](SGNLEventSuggestionsMetrics, "recordUserInteraction:withLinkInApplication:eventPrefillMode:eventTypeClassification:proposedEvent:confirmedEvent:", v7, v8, v9, v10, v11);

  }
  -[DDEventEditViewController setCancellable:](v29, "setCancellable:", 1);
  objc_msgSend(location[0], "setEditViewDelegate:");
  objc_msgSend(location[0], "dismissViewControllerAnimated:completion:", 0, 0);
  objc_storeStrong((id *)&v29->_eventEditViewController, 0);
  v6 = -[DDEventEditViewController _remoteViewControllerProxy](v29, "_remoteViewControllerProxy");
  objc_msgSend(v6, "actionDidFinishShouldDismiss:", 1);

  objc_storeStrong(location, 0);
}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
  ;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v4;
  id v6;
  id v7;
  BOOL v8;
  void **v9;
  int v10;
  int v11;
  void (*v12)(id *, void *);
  void *v13;
  id v14;
  id v15;
  objc_super v16;
  id v17;
  id location[2];
  DDEventEditViewController *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16.receiver = v19;
  v16.super_class = (Class)DDEventEditViewController;
  -[DDEventEditViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v16, "willTransitionToTraitCollection:withTransitionCoordinator:", location[0], v17);
  v6 = objc_msgSend(location[0], "verticalSizeClass");
  v7 = -[DDEventEditViewController traitCollection](v19, "traitCollection");
  v8 = v6 == objc_msgSend(v7, "verticalSizeClass");

  if (!v8)
  {
    v4 = v17;
    v9 = _NSConcreteStackBlock;
    v10 = -1073741824;
    v11 = 0;
    v12 = sub_1000151BC;
    v13 = &unk_100020880;
    v14 = location[0];
    v15 = v17;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", &v9);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id location[2];
  DDEventEditViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[EKEventEditViewController cancelEditing](v4->_eventEditViewController, "cancelEditing");
  objc_storeStrong(location, 0);
}

- (DDAction)action
{
  return (DDAction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTypeClassification, 0);
  objc_storeStrong((id *)&self->_proposedEvent, 0);
  objc_storeStrong((id *)&self->_eventEditViewController, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
