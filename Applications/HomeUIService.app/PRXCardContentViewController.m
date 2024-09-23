@implementation PRXCardContentViewController

- (id)addProminentButtonWithTitleKey:(id)a3 target:(id)a4 futureSelector:(SEL)a5
{
  return -[PRXCardContentViewController _addButtonWithTitleKey:style:target:futureSelector:](self, "_addButtonWithTitleKey:style:target:futureSelector:", a3, 0, a4, a5);
}

- (id)addProminentButtonWithLocalizedTitle:(id)a3 target:(id)a4 futureSelector:(SEL)a5
{
  return -[PRXCardContentViewController _addButtonWithLocalizedTitle:style:target:futureSelector:](self, "_addButtonWithLocalizedTitle:style:target:futureSelector:", a3, 0, a4, a5);
}

- (id)addProminentDismissButtonWithTitleKey:(id)a3
{
  id v5;
  PRXCardContentViewController *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if ((-[PRXCardContentViewController conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___HSProxCardConfigurable) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRXCardContentViewController+HSAdditions.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self conformsToProtocol:@protocol(HSProxCardConfigurable)]"));

  }
  if (-[PRXCardContentViewController conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___HSProxCardConfigurable))v6 = self;
  else
    v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PRXCardContentViewController addProminentButtonWithTitleKey:target:futureSelector:](self, "addProminentButtonWithTitleKey:target:futureSelector:", v5, v6, "dismissFuture"));

  return v7;
}

- (id)addOptionalButtonWithTitleKey:(id)a3 target:(id)a4 futureSelector:(SEL)a5
{
  return -[PRXCardContentViewController _addButtonWithTitleKey:style:target:futureSelector:](self, "_addButtonWithTitleKey:style:target:futureSelector:", a3, 1, a4, a5);
}

- (id)addOptionalButtonWithLocalizedTitle:(id)a3 target:(id)a4 futureSelector:(SEL)a5
{
  return -[PRXCardContentViewController _addButtonWithLocalizedTitle:style:target:futureSelector:](self, "_addButtonWithLocalizedTitle:style:target:futureSelector:", a3, 1, a4, a5);
}

- (id)addOptionalDismissButtonWithLocalizedTitleKey:(id)a3
{
  id v5;
  PRXCardContentViewController *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if ((-[PRXCardContentViewController conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___HSProxCardConfigurable) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRXCardContentViewController+HSAdditions.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self conformsToProtocol:@protocol(HSProxCardConfigurable)]"));

  }
  if (-[PRXCardContentViewController conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___HSProxCardConfigurable))v6 = self;
  else
    v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PRXCardContentViewController addOptionalButtonWithTitleKey:target:futureSelector:](self, "addOptionalButtonWithTitleKey:target:futureSelector:", v5, v6, "dismissFuture"));

  return v7;
}

- (void)addIdentifyButtonWithCoordinator:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = HULocalizedString(CFSTR("HUChildServiceModuleIdentifyAccessoryViewTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000284AC;
  v10[3] = &unk_1000A2130;
  objc_copyWeak(&v12, &location);
  v7 = v4;
  v11 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v6, 1, v10));
  v9 = -[PRXCardContentViewController addAction:](self, "addAction:", v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)addDismissButtonWithCoordinator:(id)a3
{
  -[PRXCardContentViewController addDismissButtonWithCoordinator:dismissAfterExecuting:](self, "addDismissButtonWithCoordinator:dismissAfterExecuting:", a3, 0);
}

- (void)addDismissButtonWithCoordinator:(id)a3 dismissAfterExecuting:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  char v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  _QWORD v26[4];
  id v27;
  PRXCardContentViewController *v28;
  id v29;
  id v30;
  uint64_t v31;
  char v32;

  v6 = a3;
  v7 = a4;
  -[PRXCardContentViewController setDismissalType:](self, "setDismissalType:", (unint64_t)-[PRXCardContentViewController dismissalType](self, "dismissalType") | 1);
  if (!objc_msgSend(v6, "requiresDismissalConfirmation"))
  {
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100028F68;
    v22[3] = &unk_1000A21D0;
    objc_copyWeak(&v24, &location);
    v23 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", &stru_1000A3BA0, 0, v22));

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    goto LABEL_22;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAccessoryTuple"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessory"));

  v10 = objc_msgSend(v6, "isInSetupContext");
  v11 = v10;
  if (!v9)
  {
    v12 = 0;
    if ((v10 & 1) != 0)
    {
      v13 = CFSTR("HUProximityCardExitFlowConfirmationMessage_PrePairing");
      goto LABEL_16;
    }
LABEL_17:
    v18 = 0;
    goto LABEL_18;
  }
  if ((objc_msgSend(v9, "isBridged") & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hf_bridgedAccessories"));
    v16 = objc_msgSend(v15, "count");

    if (v16)
      v12 = 0;
    else
      v12 = v11;
    if (v11)
    {
      if (v16)
        v13 = CFSTR("HUProximityCardExitFlowConfirmationMessage_PostPairingNonStandaloneAccessories");
      else
        v13 = CFSTR("HUProximityCardExitFlowConfirmationMessage_PostPairing");
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v12 = 0;
  if ((v11 & 1) == 0)
    goto LABEL_17;
  v13 = CFSTR("HUProximityCardExitFlowConfirmationMessage_PostPairingNonStandaloneAccessories");
LABEL_16:
  v17 = HULocalizedString(v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
LABEL_18:
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  if (objc_msgSend(v6, "launchReason") == (id)1)
    v19 = 29;
  else
    v19 = 28;
  v26[2] = sub_100028910;
  v26[3] = &unk_1000A21A8;
  v32 = v12;
  v27 = v18;
  v28 = self;
  v29 = v9;
  v30 = v7;
  v31 = v19;
  v20 = v9;
  v21 = v18;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", &stru_1000A3BA0, 0, v26));

LABEL_22:
  -[PRXCardContentViewController setDismissButtonAction:](self, "setDismissButtonAction:", v14);

}

- (id)dismissFuture
{
  return +[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8260);
}

- (id)_addButtonWithTitleKey:(id)a3 style:(int64_t)a4 target:(id)a5 futureSelector:(SEL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;

  v10 = a3;
  v11 = a5;
  v12 = sub_1000594E4(v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = HULocalizedStringWithDefaultValue(v10, v13);
  v15 = (id)objc_claimAutoreleasedReturnValue(v14);

  if (!v15)
    v15 = v10;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PRXCardContentViewController _addButtonWithLocalizedTitle:style:target:futureSelector:](self, "_addButtonWithLocalizedTitle:style:target:futureSelector:", v15, a4, v11, a6));

  return v16;
}

- (id)_addButtonWithLocalizedTitle:(id)a3 style:(int64_t)a4 target:(id)a5 futureSelector:(SEL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21[2];
  id location;

  v10 = a3;
  v11 = a5;
  objc_initWeak(&location, self);
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1000291C4;
  v19 = &unk_1000A21F8;
  objc_copyWeak(v21, &location);
  v12 = v11;
  v20 = v12;
  v21[1] = (id)a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v10, a4, &v16));
  v14 = -[PRXCardContentViewController addAction:](self, "addAction:", v13, v16, v17, v18, v19);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  return v13;
}

- (void)handleButtonDirectiveFuture:(id)a3
{
  PRXCardContentViewController *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((-[PRXCardContentViewController conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___HSProxCardConfigurable) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRXCardContentViewController+HSAdditions.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self conformsToProtocol:@protocol(HSProxCardConfigurable)]"));

  }
  if (-[PRXCardContentViewController conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___HSProxCardConfigurable))v5 = self;
  else
    v5 = 0;
  -[PRXCardContentViewController handleButtonDirectiveFuture:target:](self, "handleButtonDirectiveFuture:target:", v7, v5);

}

- (void)handleButtonDirectiveFuture:(id)a3 target:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  PRXCardContentViewController *v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PRXCardContentViewController performSelector:](self, "performSelector:", "coordinator"));
  -[PRXCardContentViewController showActivityIndicatorWithStatus:](self, "showActivityIndicatorWithStatus:", &stru_1000A3BA0);
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100029450;
  v15[3] = &unk_1000A2220;
  v9 = v8;
  v16 = v9;
  v10 = v7;
  v17 = v10;
  v18 = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "flatMap:", v15));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002950C;
  v13[3] = &unk_1000A11E8;
  objc_copyWeak(&v14, &location);
  v12 = objc_msgSend(v11, "addCompletionBlock:", v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (id)futureReturningDirectiveFromTarget:(id)a3 selector:(SEL)a4
{
  id v5;
  uint64_t (*v6)(id, SEL);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;

  v5 = a3;
  if ((objc_opt_respondsToSelector(v5, a4) & 1) != 0)
  {
    v6 = (uint64_t (*)(id, SEL))objc_msgSend(v5, "methodForSelector:", a4);
    v8 = objc_opt_class(NAFuture, v7);
    v9 = v6(v5, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_isKindOfClass(v10, v8) & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "flatMap:", &stru_1000A2240));
    }
    else
    {
      v20 = NSStringFromSelector(a4);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      NSLog(CFSTR("Did not receive a future.  target (%@) action %@"), v5, v21);

      v23 = HFLogForCategory(58, v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_10005F5E8((int)v5, a4);

      v13 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8260));
    }
    v19 = (void *)v13;

  }
  else
  {
    v14 = NSStringFromSelector(a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    NSLog(CFSTR("target (%@) does not respond to selector (%@)"), v5, v15);

    v17 = HFLogForCategory(58, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10005F66C((int)v5, a4);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", &off_1000A8260));
  }

  return v19;
}

- (void)performPRXLayoutPass
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PRXCardContentViewController performSelector:](self, "performSelector:", "contentVC"));
  if (!v3)
  {
    NSLog(&CFSTR("Performing a PRX layout pass only makes sense in the context of a nested child VC that needs to request relay"
                 "out.  Check why is self.contentVC nil").isa);
    v5 = HFLogForCategory(58, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10005F720(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v14, "layoutIfNeeded");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PRXCardContentViewController contentView](self, "contentView"));
  objc_msgSend(v15, "setNeedsUpdateConstraints");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PRXCardContentViewController view](self, "view"));
  objc_msgSend(v16, "bounds");
  -[PRXCardContentViewController updatePreferredContentSizeForCardWidth:](self, "updatePreferredContentSizeForCardWidth:", v17);

}

@end
