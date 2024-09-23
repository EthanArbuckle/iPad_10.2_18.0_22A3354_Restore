@implementation AAUIFamilySetupPrompter

- (AAUIFamilySetupPrompter)init
{
  AAUIFamilySetupPrompter *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  uint64_t v7;
  FAFamilySetupPrompter *familySetupPrompter;
  objc_super v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v10.receiver = self;
  v10.super_class = (Class)AAUIFamilySetupPrompter;
  v2 = -[AAUIFamilySetupPrompter init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ams_activeiTunesAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v5 = (void *)getFAFamilySetupPrompterClass_softClass;
    v15 = getFAFamilySetupPrompterClass_softClass;
    if (!getFAFamilySetupPrompterClass_softClass)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getFAFamilySetupPrompterClass_block_invoke;
      v11[3] = &unk_1EA2DB6E8;
      v11[4] = &v12;
      __getFAFamilySetupPrompterClass_block_invoke((uint64_t)v11);
      v5 = (void *)v13[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v12, 8);
    v7 = objc_msgSend([v6 alloc], "initWithiTunesAccount:", v4);
    familySetupPrompter = v2->_familySetupPrompter;
    v2->_familySetupPrompter = (FAFamilySetupPrompter *)v7;

    -[FAFamilySetupPrompter setDelegate:](v2->_familySetupPrompter, "setDelegate:", v2);
  }
  return v2;
}

- (void)promptIfEligibleWithPresentingViewController:(id)a3 isFirstRun:(BOOL)a4
{
  -[FAFamilySetupPrompter promptIfEligibleWithPresentingViewController:isFirstRun:](self->_familySetupPrompter, "promptIfEligibleWithPresentingViewController:isFirstRun:", a3, a4);
}

- (void)familySetupPrompterDidFinish:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "familySetupPrompterDidFinish:", self);

}

- (AAUIFamilySetupPrompterDelegate)delegate
{
  return (AAUIFamilySetupPrompterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_familySetupPrompter, 0);
}

@end
