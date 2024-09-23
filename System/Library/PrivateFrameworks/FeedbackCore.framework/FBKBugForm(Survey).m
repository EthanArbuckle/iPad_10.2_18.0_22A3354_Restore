@implementation FBKBugForm(Survey)

- (void)canTakeForTeam:()Survey .cold.1(uint8_t *a1, void *a2, _DWORD *a3, NSObject *a4)
{
  void *v7;
  int v8;

  objc_msgSend(a2, "ID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");
  *(_DWORD *)a1 = 67109120;
  *a3 = v8;
  _os_log_error_impl(&dword_21D9A9000, a4, OS_LOG_TYPE_ERROR, "feedback in feedback item not found, cannot determine canTake for survey [%i]", a1, 8u);

}

@end
