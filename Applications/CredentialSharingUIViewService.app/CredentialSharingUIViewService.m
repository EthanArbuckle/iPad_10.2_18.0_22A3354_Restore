void sub_100001CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100001D04(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setMessage:", v4);

  v6 = *(void **)(a1 + 32);
  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);

}

void sub_100001E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100001E98(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setMessage:", v4);

  v6 = *(void **)(a1 + 32);
  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);

}

int main(int argc, const char **argv, const char **envp)
{
  void *v5;
  objc_class *v6;
  NSString *v7;
  NSString *v8;
  objc_class *v9;
  NSString *v10;
  NSString *v11;

  v5 = objc_autoreleasePoolPush();
  v6 = (objc_class *)objc_opt_class(CredentialSharingUIServiceApplication);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (objc_class *)objc_opt_class(CredentialSharingUIServiceAppDelegate);
  v10 = NSStringFromClass(v9);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue(v10);
  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, v8, v11);

  objc_autoreleasePoolPop(v5);
  return (int)argv;
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appearance");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelColor");
}

id objc_msgSend_messageComposeViewControllerDidFinishWithResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageComposeViewControllerDidFinishWithResult:");
}

id objc_msgSend_messageFromConfiguration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageFromConfiguration:completionHandler:");
}

id objc_msgSend_messageFromInvitation_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageFromInvitation:completionHandler:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setMessageComposeDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessageComposeDelegate:");
}

id objc_msgSend_setRecipients_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecipients:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}
