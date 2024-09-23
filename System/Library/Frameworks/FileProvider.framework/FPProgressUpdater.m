@implementation FPProgressUpdater

- (void)reportProgressUpdate:(int64_t)a3 totalUnitCount:(int64_t)a4 completedFileCount:(int64_t)a5 totalFileCount:(int64_t)a6
{
  id WeakRetained;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  WeakRetained = objc_loadWeakRetained((id *)&self->_progress);

  if (WeakRetained)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFileTotalCount:", v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFileCompletedCount:", v14);

    objc_msgSend(v12, "setTotalUnitCount:", a4);
    objc_msgSend(v12, "setCompletedUnitCount:", a3);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __91__FPProgressUpdater_reportProgressUpdate_totalUnitCount_completedFileCount_totalFileCount___block_invoke;
    v16[3] = &unk_1E4449A40;
    v16[4] = self;
    v17 = v12;
    v15 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], v16);

  }
}

void __91__FPProgressUpdater_reportProgressUpdate_totalUnitCount_completedFileCount_totalFileCount___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "updateWithProgress:", *(_QWORD *)(a1 + 40));

}

- (FPProgressProxy)progress
{
  return (FPProgressProxy *)objc_loadWeakRetained((id *)&self->_progress);
}

- (void)setProgress:(id)a3
{
  objc_storeWeak((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_progress);
}

@end
