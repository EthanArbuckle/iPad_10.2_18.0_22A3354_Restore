@implementation SFCreditCardCaptureViewController

void __68___SFCreditCardCaptureViewController_cameraReader_didFailWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "creditCardCaptureViewControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

void __57___SFCreditCardCaptureViewController_cameraReaderDidEnd___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "creditCardCaptureViewController:didCaptureCreditCard:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1416));

}

void __60___SFCreditCardCaptureViewController_cameraReaderDidCancel___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "creditCardCaptureViewControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

@end
