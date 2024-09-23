@implementation HSPCCHIPPartnerRoomProvider

- (id)loadData
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id location;

  v3 = objc_opt_class(HSSetupStateMachineCHIPPartnerConfiguration, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[HSPCDataProvider config](self, "config"));
  v5 = v4;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)"));
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class(v5, v10));

    }
  }
  else
  {
    v7 = 0;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedPartnerHome"));
  if (v11)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "targetEcosystem"));
    if (v12)
    {
      objc_initWeak(&location, self);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100054930;
      v37[3] = &unk_1000A18B0;
      v12 = v12;
      v38 = v12;
      v39 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithCompletionHandlerAdapterBlock:](NAFuture, "futureWithCompletionHandlerAdapterBlock:", v37));
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10005498C;
      v35[3] = &unk_1000A1300;
      objc_copyWeak(&v36, &location);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flatMap:", v35));
      objc_destroyWeak(&v36);

      objc_destroyWeak(&location);
    }
    else
    {
      v24 = HFLogForCategory(58);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_100060ED0(v25, v26, v27, v28, v29, v30, v31, v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hmfErrorWithCode:](NSError, "hmfErrorWithCode:", 8));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v33));

    }
  }
  else
  {
    v15 = HFLogForCategory(58);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100060E9C(v16, v17, v18, v19, v20, v21, v22, v23);

    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError hmfErrorWithCode:](NSError, "hmfErrorWithCode:", 8));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v12));
  }

  return v14;
}

- (id)userFacingStringForItem:(id)a3
{
  return objc_msgSend(a3, "name");
}

- (unint64_t)initialRowIndex
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDataProvider items](self, "items"));
  v3 = (unint64_t)objc_msgSend(v2, "count") >> 1;

  return v3;
}

@end
