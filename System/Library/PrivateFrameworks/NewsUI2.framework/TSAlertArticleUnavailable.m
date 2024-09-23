@implementation TSAlertArticleUnavailable

- (TSAlertArticleUnavailable)initWithBlockedReason:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  TSAlertArticleUnavailable *v8;
  objc_class *v9;
  objc_super v11;

  v4 = sub_1D6E17744();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_1D6E17714();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v8 + OBJC_IVAR___TSAlertArticleUnavailable_alert, v7, v4);

  v9 = (objc_class *)type metadata accessor for BridgedAlertArticleUnavailable();
  v11.receiver = v8;
  v11.super_class = v9;
  return -[TSAlertArticleUnavailable init](&v11, sel_init);
}

- (TSAlertArticleUnavailable)initWithType:(int64_t)a3
{
  char *v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  TSAlertArticleUnavailable *result;
  TSAlertArticleUnavailable *v9;
  objc_super v10;

  if (a3 == 1)
  {
    v4 = (char *)self + OBJC_IVAR___TSAlertArticleUnavailable_alert;
    v5 = (unsigned int *)MEMORY[0x1E0D577F8];
LABEL_5:
    v6 = *v5;
    v7 = sub_1D6E17744();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v4, v6, v7);
    v10.receiver = self;
    v10.super_class = (Class)type metadata accessor for BridgedAlertArticleUnavailable();
    return -[TSAlertArticleUnavailable init](&v10, sel_init);
  }
  if (!a3)
  {
    v4 = (char *)self + OBJC_IVAR___TSAlertArticleUnavailable_alert;
    v5 = (unsigned int *)MEMORY[0x1E0D577F0];
    goto LABEL_5;
  }
  v9 = self;
  result = (TSAlertArticleUnavailable *)sub_1D6E28328();
  __break(1u);
  return result;
}

- (NSString)title
{
  return (NSString *)sub_1D6C94AF8(self, (uint64_t)a2, (void (*)(void))MEMORY[0x1E0D57820]);
}

- (NSString)message
{
  return (NSString *)sub_1D6C94AF8(self, (uint64_t)a2, (void (*)(void))MEMORY[0x1E0D57830]);
}

- (TSAlertArticleUnavailable)init
{
  TSAlertArticleUnavailable *result;

  result = (TSAlertArticleUnavailable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___TSAlertArticleUnavailable_alert;
  v3 = sub_1D6E17744();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
