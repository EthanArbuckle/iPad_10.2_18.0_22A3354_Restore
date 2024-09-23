@implementation MTLAddMessageObserver

void __MTLAddMessageObserver_block_invoke()
{
  if (!s_notifierArray)
    s_notifierArray = objc_opt_new();
}

void __MTLAddMessageObserver_block_invoke_60(_QWORD *a1)
{
  id v2;

  v2 = -[_MTLMessageNotifier init:filter:]([_MTLMessageNotifier alloc], "init:filter:", a1[5], a1[4]);
  objc_msgSend((id)s_notifierArray, "addObject:", v2);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = v2;

}

@end
