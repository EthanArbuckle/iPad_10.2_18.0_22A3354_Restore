void sub_100002008(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t Object;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;

  v3 = a2;
  Object = PKLogFacilityTypeGetObject(0, v4);
  v6 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Presenting compose view controller: %@ for message: %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setMessage:", v3);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 1, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

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
  v6 = (objc_class *)objc_opt_class(SubcredentialUIServiceApplication);
  v7 = NSStringFromClass(v6);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (objc_class *)objc_opt_class(SubcredentialUIServiceAppDelegate);
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

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelColor");
}

id objc_msgSend_messageComposeViewControllerDidFinishWithResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageComposeViewControllerDidFinishWithResult:");
}

id objc_msgSend_messageFromSharingRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageFromSharingRequest:completionHandler:");
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

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}
