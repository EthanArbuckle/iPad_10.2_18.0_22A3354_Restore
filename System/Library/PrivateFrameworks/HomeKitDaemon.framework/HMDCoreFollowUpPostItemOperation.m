@implementation HMDCoreFollowUpPostItemOperation

- (HMDCoreFollowUpPostItemOperation)initWithItemToPost:(id)a3 followUpController:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDCoreFollowUpPostItemOperation *v10;
  HMDCoreFollowUpPostItemOperation *v11;
  HMDCoreFollowUpPostItemOperation *result;
  HMDCoreFollowUpPostItemOperation *v13;
  SEL v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v7)
  {
LABEL_7:
    v13 = (HMDCoreFollowUpPostItemOperation *)_HMFPreconditionFailure();
    -[HMDCoreFollowUpPostItemOperation main](v13, v14);
    return result;
  }
  v9 = v8;
  v15.receiver = self;
  v15.super_class = (Class)HMDCoreFollowUpPostItemOperation;
  v10 = -[HMFOperation initWithTimeout:](&v15, sel_initWithTimeout_, 0.0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_itemToPost, a3);
    objc_storeStrong((id *)&v11->_followUpController, a4);
  }

  return v11;
}

- (void)main
{
  void *v3;
  HMDCoreFollowUpPostItemOperation *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCoreFollowUpPostItemOperation itemToPost](v4, "itemToPost");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Posting advertisement for new followup item: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_initWeak((id *)buf, v4);
  -[HMDCoreFollowUpPostItemOperation followUpController](v4, "followUpController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__HMDCoreFollowUpPostItemOperation_main__block_invoke;
  v9[3] = &unk_24E7805D0;
  objc_copyWeak(&v10, (id *)buf);
  objc_msgSend(v8, "pendingFollowUpItemsWithCompletion:", v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (HMDFollowUpItem)itemToPost
{
  return self->_itemToPost;
}

- (void)setItemToPost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (HMDFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
  objc_storeStrong((id *)&self->_followUpController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_itemToPost, 0);
}

void __40__HMDCoreFollowUpPostItemOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  int v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  char v51;
  id obj;
  id val;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id location;
  _BYTE v61[24];
  void *v62;
  id v63[2];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v48 = v6;
  val = WeakRetained;
  if (v6)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v65 = v11;
      v66 = 2112;
      v67 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch pending followup items with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    WeakRetained = val;
  }
  objc_msgSend(WeakRetained, "itemToPost", v48);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v5;
  v14 = v13;
  if (val)
  {
    objc_initWeak(&location, val);
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = v50;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, buf, 16);
    if (v15)
    {
      v54 = *(_QWORD *)v57;
      v51 = 1;
LABEL_8:
      v55 = v15;
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v57 != v54)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v16);
        objc_msgSend(v17, "uniqueIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uniqueIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if ((v20 & 1) != 0)
        {
          objc_msgSend(v17, "uniqueIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "uniqueIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v21, "isEqualToString:", v22))
            goto LABEL_21;
          objc_msgSend(v17, "targetBundleIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "targetBundleIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v23, "isEqualToString:", v24))
          {

LABEL_21:
            goto LABEL_22;
          }
          objc_msgSend(v17, "title");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "title");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "isEqualToString:", v26);

          if ((v27 & 1) == 0)
          {
            v42 = (void *)MEMORY[0x227676638]();
            v43 = val;
            HMFGetOSLogHandle();
            v44 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v46 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "uniqueIdentifier");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v61 = 138543618;
              *(_QWORD *)&v61[4] = v46;
              *(_WORD *)&v61[12] = 2112;
              *(_QWORD *)&v61[14] = v47;
              _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Detected followup item with same identifier (%@), but different title, removing and reposting.", v61, 0x16u);

            }
            objc_autoreleasePoolPop(v42);
            objc_msgSend(v43, "followUpController");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDCoreFollowUpManager allPossibleFollowUpItemIdentifiers](HMDCoreFollowUpManager, "allPossibleFollowUpItemIdentifiers");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)v61 = MEMORY[0x24BDAC760];
            *(_QWORD *)&v61[8] = 3221225472;
            *(_QWORD *)&v61[16] = __93__HMDCoreFollowUpPostItemOperation__postFollowUpItemIfDifferentFromExistingItems_itemToPost___block_invoke_5;
            v62 = &unk_24E790260;
            objc_copyWeak(v63, &location);
            objc_msgSend(v40, "clearPendingFollowUpItemsWithUniqueIdentifiers:completion:", v41, v61);
LABEL_29:

            objc_destroyWeak(v63);
            goto LABEL_32;
          }
        }
        else
        {
          objc_msgSend(v14, "uniqueIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("com.apple.HomeKit.UpdateTvOS"));

          v30 = (void *)MEMORY[0x227676638]();
          v31 = val;
          if (v29)
          {
            HMFGetOSLogHandle();
            v36 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v37 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "uniqueIdentifier");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "uniqueIdentifier");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v61 = 138543874;
              *(_QWORD *)&v61[4] = v37;
              *(_WORD *)&v61[12] = 2112;
              *(_QWORD *)&v61[14] = v38;
              *(_WORD *)&v61[22] = 2112;
              v62 = v39;
              _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Removing existing followup with identifier: %@ in favor of: %@", v61, 0x20u);

            }
            objc_autoreleasePoolPop(v30);
            objc_msgSend(v31, "followUpController");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDCoreFollowUpManager allPossibleFollowUpItemIdentifiers](HMDCoreFollowUpManager, "allPossibleFollowUpItemIdentifiers");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)v61 = MEMORY[0x24BDAC760];
            *(_QWORD *)&v61[8] = 3221225472;
            *(_QWORD *)&v61[16] = __93__HMDCoreFollowUpPostItemOperation__postFollowUpItemIfDifferentFromExistingItems_itemToPost___block_invoke;
            v62 = &unk_24E790260;
            objc_copyWeak(v63, &location);
            objc_msgSend(v40, "clearPendingFollowUpItemsWithUniqueIdentifiers:completion:", v41, v61);
            goto LABEL_29;
          }
          HMFGetOSLogHandle();
          v32 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v33 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "uniqueIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "uniqueIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v61 = 138543874;
            *(_QWORD *)&v61[4] = v33;
            *(_WORD *)&v61[12] = 2112;
            *(_QWORD *)&v61[14] = v34;
            *(_WORD *)&v61[22] = 2112;
            v62 = v35;
            _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Not posting followup with identifier: %@ as currently posted followup is preferred: %@", v61, 0x20u);

          }
          objc_autoreleasePoolPop(v30);
          v51 = 0;
        }
LABEL_22:
        if (v55 == ++v16)
        {
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, buf, 16);
          if (v15)
            goto LABEL_8;

          if ((v51 & 1) == 0)
          {
            objc_msgSend(val, "finish");
            goto LABEL_32;
          }
          goto LABEL_31;
        }
      }
    }

LABEL_31:
    -[HMDCoreFollowUpPostItemOperation _postFollowUpItem](val);
LABEL_32:
    objc_destroyWeak(&location);
  }

}

void __93__HMDCoreFollowUpPostItemOperation__postFollowUpItemIfDifferentFromExistingItems_itemToPost___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HMDCoreFollowUpPostItemOperation _postFollowUpItem](WeakRetained);

}

void __93__HMDCoreFollowUpPostItemOperation__postFollowUpItemIfDifferentFromExistingItems_itemToPost___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HMDCoreFollowUpPostItemOperation _postFollowUpItem](WeakRetained);

}

- (void)_postFollowUpItem
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = a1;
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "itemToPost");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Posting followup item: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    objc_initWeak((id *)buf, v3);
    objc_msgSend(v3, "followUpController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "itemToPost");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__HMDCoreFollowUpPostItemOperation__postFollowUpItem__block_invoke;
    v9[3] = &unk_24E790260;
    objc_copyWeak(&v10, (id *)buf);
    objc_msgSend(v7, "postFollowUpItem:completion:", v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __53__HMDCoreFollowUpPostItemOperation__postFollowUpItem__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = (void *)MEMORY[0x227676638]();
  v8 = WeakRetained;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemToPost");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully started advertising followup item: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v8, "finish");
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemToPost");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to advertise followup item: %@ with error: %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v8, "cancelWithError:", v5);
  }

}

@end
