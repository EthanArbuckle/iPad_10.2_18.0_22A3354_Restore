@implementation UIScrollView(NewsUIBridge)

- (uint64_t)ts_performScrollTest:()NewsUIBridge iterations:delta:extraResultsBlock:
{
  return objc_msgSend(a1, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:", a3, a4, a5, 0, 2, a6);
}

- (void)ts_performScrollTest:()NewsUIBridge iterations:length:completion:
{
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v9 = a6;
  v10 = objc_alloc_init(MEMORY[0x1E0DC3C20]);
  objc_msgSend(v10, "setIterations:", a5);
  objc_msgSend(v10, "setLength:", a2);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__UIScrollView_NewsUIBridge__ts_performScrollTest_iterations_length_completion___block_invoke;
  v12[3] = &unk_1E9AAABA8;
  v13 = v9;
  v11 = v9;
  objc_msgSend(a1, "_performScrollTestWithParameters:completionBlock:", v10, v12);

}

@end
