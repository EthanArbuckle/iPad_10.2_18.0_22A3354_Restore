@implementation IMDFilePurgeabilityMonitor

+ (id)sharedInstance
{
  if (qword_1ED935648 != -1)
    swift_once();
  return (id)qword_1ED935638;
}

- (IMDFilePurgeabilityMonitor)init
{
  return (IMDFilePurgeabilityMonitor *)sub_1D1613588();
}

- (void)observeFileEvents:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  IMDFilePurgeabilityMonitor *v8;
  uint64_t v9;

  v4 = sub_1D166D460();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D166D43C();
  v8 = self;
  sub_1D16137DC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)userNotificationDidFinish:(id)a3
{
  id v5;
  IMDFilePurgeabilityMonitor *v6;

  v5 = a3;
  v6 = self;
  IMDFilePurgeabilityMonitor.userNotificationDidFinish(_:)(a3);

}

- (void)dealloc
{
  IMDFilePurgeabilityMonitor *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v7;

  sub_1D15FD3C0(0, &qword_1EFC62B30);
  v3 = self;
  v4 = (void *)sub_1D1615868();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_removeListener_, v3);

  }
  v6 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_, v3);

  v7.receiver = v3;
  v7.super_class = (Class)IMDFilePurgeabilityMonitor;
  -[IMDFilePurgeabilityMonitor dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{

}

@end
