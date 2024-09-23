@implementation CKSendLaterPluginInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)selectedDate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  CKSendLaterPluginInfo *v10;
  void (*v11)(char *, uint64_t);
  void *v12;
  uint64_t v14;

  v3 = sub_18E766284();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v14 - v8;
  sub_18E766254();
  v10 = self;
  sub_18E71C298((uint64_t)v9);
  v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v6, v3);

  v12 = (void *)sub_18E76620C();
  v11(v9, v3);
  return (NSDate *)v12;
}

- (void)setSelectedDate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  CKSendLaterPluginInfo *v7;
  uint64_t v8;

  v4 = sub_18E766284();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E766254();
  v7 = self;
  sub_18E71BD14(v6);

}

- (BOOL)showingDatePicker
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CKSendLaterPluginInfo_showingDatePicker);
}

- (void)setShowingDatePicker:(BOOL)a3
{
  CKSendLaterPluginInfo *v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___CKSendLaterPluginInfo_showingDatePicker) = a3;
  v3 = self;
  sub_18E71C600();

}

- (CKSendLaterPluginInfo)initWithSelectedDate:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v3 = sub_18E766284();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E766254();
  return (CKSendLaterPluginInfo *)sub_18E71C998(v5);
}

- (CKSendLaterPluginInfo)initWithConversation:(id)a3
{
  return (CKSendLaterPluginInfo *)sub_18E71DA10(a3);
}

- (CKSendLaterPluginInfo)init
{
  return (CKSendLaterPluginInfo *)sub_18E71DFE8();
}

- (CKSendLaterPluginInfo)initWithCoder:(id)a3
{
  return (CKSendLaterPluginInfo *)CKSendLaterPluginInfo.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  CKSendLaterPluginInfo *v6;
  id v7;
  id v8;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKSendLaterPluginInfo__selectedDate);
  v5 = a3;
  v6 = self;
  v7 = v4;
  v8 = (id)sub_18E768954();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);

}

- (void)dealloc
{
  void *v3;
  CKSendLaterPluginInfo *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKSendLaterPluginInfo_updateTimer);
  v4 = self;
  if (v3)
    objc_msgSend(v3, sel_invalidate);
  v5.receiver = self;
  v5.super_class = (Class)CKSendLaterPluginInfo;
  -[CKSendLaterPluginInfo dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{

}

- (void)addObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___CKSendLaterPluginInfo_observers), sel_addObject_, a3);
}

@end
