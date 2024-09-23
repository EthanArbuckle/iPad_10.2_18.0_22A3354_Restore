@implementation InstapaperLoginSession

- (void)engine:(id)a3 connection:(id)a4 didReceiveAuthToken:(id)a5 andTokenSecret:(id)a6
{
  id v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _TtC11ActionKitUI22InstapaperLoginSession *v17;
  uint64_t v18;

  v6 = a6;
  if (!a5)
  {
    v10 = 0;
    v12 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v10 = sub_21EBB7B60();
  v12 = v11;
  if (!v6)
    goto LABEL_5;
LABEL_3:
  v13 = sub_21EBB7B60();
  v6 = v14;
LABEL_6:
  v15 = a3;
  v16 = a4;
  v17 = self;
  sub_21EB69A10((uint64_t)v17, v18, v10, v12, v13, (uint64_t)v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)engine:(id)a3 didFailConnection:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC11ActionKitUI22InstapaperLoginSession *v10;
  uint64_t v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v12 = a5;
  sub_21EB69C88((uint64_t)v12, v11, a5);

}

- (_TtC11ActionKitUI22InstapaperLoginSession)init
{
  sub_21EB6A0B8();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_10();
  sub_21EB67980((uint64_t)self + OBJC_IVAR____TtC11ActionKitUI22InstapaperLoginSession_continuation, &qword_255477C08);
}

@end
