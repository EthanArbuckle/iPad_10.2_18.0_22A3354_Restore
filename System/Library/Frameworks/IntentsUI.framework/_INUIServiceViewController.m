@implementation _INUIServiceViewController

- (_INUIServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _INUIServiceViewController *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)_INUIServiceViewController;
  v4 = -[_INUIServiceViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C89660];
    v10 = 0;
    objc_msgSend(v5, "setCategory:withOptions:error:", v6, 1, &v10);
    v7 = v10;

    if (v7)
    {
      v8 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[_INUIServiceViewController initWithNibName:bundle:]";
        v14 = 2114;
        v15 = v7;
        _os_log_error_impl(&dword_1DC055000, v8, OS_LOG_TYPE_ERROR, "%s Unable to set AVAudioSession category: %{public}@", buf, 0x16u);
      }
    }

  }
  return v4;
}

- (void)addChildViewController:(id)a3
{
  id v5;
  INUIHostedViewControlling **p_hostedViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_INUIServiceViewController;
  -[_INUIServiceViewController addChildViewController:](&v11, sel_addChildViewController_, v5);
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F036AC40))
  {
    p_hostedViewController = &self->_hostedViewController;
    objc_storeStrong((id *)&self->_hostedViewController, a3);
    -[INUIHostedViewControlling view](self->_hostedViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_INUIServiceViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    objc_msgSend(v7, "setFrame:");

    -[_INUIServiceViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[INUIHostedViewControlling view](*p_hostedViewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_INUIServiceViewController;
  -[_INUIServiceViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[INUIHostedViewControlling view](self->_hostedViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INUIServiceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_INUIServiceViewController;
  -[_INUIServiceViewController beginRequestWithExtensionContext:](&v8, sel_beginRequestWithExtensionContext_, v4);
  v5 = v4;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "setViewController:", self);
}

- (void)configureForParameters:(id)a3 ofInteraction:(id)a4 interactiveBehavior:(unint64_t)a5 context:(unint64_t)a6 completion:(id)a7
{
  id v11;
  id v12;
  void *v13;
  char v14;
  INUIHostedViewControlling *hostedViewController;
  void *v16;
  INUIHostedViewControlling *v17;
  INUIHostedViewControlling *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v11 = a3;
  v12 = a7;
  INTypedInteractionWithInteraction();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_currentInteraction, v13);
  self->_currentContext = a6;
  v14 = objc_opt_respondsToSelector();
  hostedViewController = self->_hostedViewController;
  if ((v14 & 1) != 0)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke;
    v24[3] = &unk_1EA43A500;
    v25 = v12;
    -[INUIHostedViewControlling configureViewForParameters:ofInteraction:interactiveBehavior:context:completion:](hostedViewController, "configureViewForParameters:ofInteraction:interactiveBehavior:context:completion:", v11, v13, a5, a6, v24);
    v16 = v25;
LABEL_8:

    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = self->_hostedViewController;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_2;
    v22[3] = &unk_1EA43A500;
    v23 = v12;
    -[INUIHostedViewControlling configureViewForParameters:ofInteraction:context:completion:](v17, "configureViewForParameters:ofInteraction:context:completion:", v11, v13, a6, v22);
    v16 = v23;
    goto LABEL_8;
  }
  if (!objc_msgSend(v11, "count"))
  {
    v18 = self->_hostedViewController;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __106___INUIServiceViewController_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke_3;
    v19[3] = &unk_1EA43A550;
    v21 = v12;
    v19[4] = self;
    v20 = v13;
    -[INUIHostedViewControlling configureWithInteraction:context:completion:](v18, "configureWithInteraction:context:completion:", v20, a6, v19);

    v16 = v21;
    goto LABEL_8;
  }
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, double, double))v12 + 2))(v12, 0, 0, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
LABEL_9:

}

- (void)viewWasCancelled
{
  NSObject *v3;
  INUIHostedViewControlling *hostedViewController;
  int v5;
  const char *v6;
  __int16 v7;
  INUIHostedViewControlling *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[INUIHostedViewControlling conformsToProtocol:](self->_hostedViewController, "conformsToProtocol:", &unk_1F036C818)&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *MEMORY[0x1E0CBD670];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_INFO))
    {
      hostedViewController = self->_hostedViewController;
      v5 = 136315394;
      v6 = "-[_INUIServiceViewController viewWasCancelled]";
      v7 = 2112;
      v8 = hostedViewController;
      _os_log_impl(&dword_1DC055000, v3, OS_LOG_TYPE_INFO, "%s Alerting remote view controller %@ of cancellation", (uint8_t *)&v5, 0x16u);
    }
    -[INUIHostedViewControlling viewWasCancelled](self->_hostedViewController, "viewWasCancelled");
  }
}

- (void)desiresInteractivity:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (-[INUIHostedViewControlling conformsToProtocol:](self->_hostedViewController, "conformsToProtocol:", &unk_1F036C818)&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[INUIHostedViewControlling desiresInteractivity:](self->_hostedViewController, "desiresInteractivity:", v4);
  }
  else
  {
    v4[2](v4, 0);
  }

}

- (void)queryRepresentedPropertiesWithCompletion:(id)a3
{
  objc_class *v4;
  void (**v5)(id, void *);
  INUIHostedViewControlling *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99DE8];
    v5 = (void (**)(id, void *))a3;
    v8 = objc_alloc_init(v4);
    if (-[INUIHostedViewControlling conformsToProtocol:](self->_hostedViewController, "conformsToProtocol:", &unk_1F036C878))
    {
      v6 = self->_hostedViewController;
      if ((objc_opt_respondsToSelector() & 1) != 0
        && -[INUIHostedViewControlling displaysMessage](v6, "displaysMessage"))
      {
        objc_msgSend(v8, "addObject:", CFSTR("SendMessageIntent.recipient"));
        objc_msgSend(v8, "addObject:", CFSTR("SendMessageIntent.recipients"));
        objc_msgSend(v8, "addObject:", CFSTR("SendMessageIntent.content"));
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && -[INUIHostedViewControlling displaysMap](v6, "displaysMap"))
      {
        objc_msgSend(v8, "addObject:", CFSTR("RequestRideIntent.pickupLocation.map"));
        objc_msgSend(v8, "addObject:", CFSTR("GetRideStatusIntentResponse.rideStatus.vehicle.location.map"));
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (-[INUIHostedViewControlling displaysPaymentTransaction](v6, "displaysPaymentTransaction"))
        {
          objc_msgSend(v8, "addObject:", CFSTR("SendPaymentIntent.payee"));
          objc_msgSend(v8, "addObject:", CFSTR("SendPaymentIntent.currencyAmount"));
          objc_msgSend(v8, "addObject:", CFSTR("SendPaymentIntent.note"));
          objc_msgSend(v8, "addObject:", CFSTR("RequestPaymentIntent.payer"));
          objc_msgSend(v8, "addObject:", CFSTR("RequestPaymentIntent.currencyAmount"));
          objc_msgSend(v8, "addObject:", CFSTR("RequestPaymentIntent.note"));
          objc_msgSend(v8, "addObject:", CFSTR("BillDetails.billType"));
          objc_msgSend(v8, "addObject:", CFSTR("BillDetails.amountDue"));
          objc_msgSend(v8, "addObject:", CFSTR("BillDetails.paymentDate"));
          objc_msgSend(v8, "addObject:", CFSTR("BillDetails.billPayee"));
          objc_msgSend(v8, "addObject:", CFSTR("PayBillIntent.billPayee"));
          objc_msgSend(v8, "addObject:", CFSTR("PayBillIntent.fromAccount"));
          objc_msgSend(v8, "addObject:", CFSTR("PayBillIntent.transactionAmount"));
          objc_msgSend(v8, "addObject:", CFSTR("PayBillIntent.transactionScheduledDate"));
          objc_msgSend(v8, "addObject:", CFSTR("PayBillIntent.transactionNote"));
          objc_msgSend(v8, "addObject:", CFSTR("PayBillIntent.billType"));
          objc_msgSend(v8, "addObject:", CFSTR("PayBillIntent.dueDate"));
          objc_msgSend(v8, "addObject:", CFSTR("PayBillIntentResponse.fromAccount"));
          objc_msgSend(v8, "addObject:", CFSTR("PayBillIntentResponse.billDetails"));
          objc_msgSend(v8, "addObject:", CFSTR("PayBillIntentResponse.transactionAmount"));
          objc_msgSend(v8, "addObject:", CFSTR("PayBillIntentResponse.transactionScheduledDate"));
          objc_msgSend(v8, "addObject:", CFSTR("PayBillIntentResponse.transactionNote"));
        }
      }

    }
    v7 = (void *)objc_msgSend(v8, "copy");
    v5[2](v5, v7);

  }
}

- (CGSize)_constrainedSizeForDesiredSize:(CGSize)a3
{
  double v3;
  double v4;
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a3.width != *MEMORY[0x1E0C9D820] || a3.height != v4)
  {
    height = a3.height;
    width = a3.width;
    -[_INUIServiceViewController extensionContext](self, "extensionContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hostedViewMinimumAllowedSize");
    v3 = v9;
    v4 = v10;
    objc_msgSend(v8, "hostedViewMaximumAllowedSize");
    if (v11 >= width)
      v11 = width;
    if (v3 < v11)
      v3 = v11;
    if (v12 >= height)
      v13 = height;
    else
      v13 = v12;
    if (v4 < v13)
      v4 = v13;

  }
  v14 = v3;
  v15 = v4;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInteraction, 0);
  objc_storeStrong((id *)&self->_hostedViewController, 0);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

@end
