@implementation MRBlockGuard

- (MRBlockGuard)initWithTimeout:(double)a3 reason:(id)a4 queue:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MRBlockGuard *v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v10 = a5;
  v11 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__MRBlockGuard_initWithTimeout_reason_queue_handler___block_invoke;
  v16[3] = &unk_1E30C75E8;
  v17 = v10;
  v18 = v11;
  v12 = v11;
  v13 = v10;
  v14 = -[MRBlockGuard initWithTimeout:reason:handler:](self, "initWithTimeout:reason:handler:", a4, v16, a3);

  return v14;
}

- (MRBlockGuard)initWithTimeout:(double)a3 reason:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  MRBlockGuard *v12;
  objc_super v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD *v18;
  double v19;
  _QWORD v20[3];
  char v21;

  v8 = a4;
  v9 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__MRBlockGuard_initWithTimeout_reason_handler___block_invoke;
  v15[3] = &unk_1E30CC2D8;
  v18 = v20;
  v10 = v8;
  v16 = v10;
  v19 = a3;
  v11 = v9;
  v17 = v11;
  v14.receiver = self;
  v14.super_class = (Class)MRBlockGuard;
  v12 = -[MSVBlockGuard initWithTimeout:interruptionHandler:](&v14, sel_initWithTimeout_interruptionHandler_, v15, a3);

  _Block_object_dispose(v20, 8);
  return v12;
}

void __53__MRBlockGuard_initWithTimeout_reason_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__MRBlockGuard_initWithTimeout_reason_queue_handler___block_invoke_2;
  v7[3] = &unk_1E30C6568;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __53__MRBlockGuard_initWithTimeout_reason_queue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __47__MRBlockGuard_initWithTimeout_reason_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v2 = 0;
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    if (a2)
      v6 = objc_msgSend(v5, "initWithMRError:format:", 25, CFSTR("Guarded operation <%@> was deallocated before disarmed"), *(_QWORD *)(a1 + 32), v8);
    else
      v6 = objc_msgSend(v5, "initWithMRError:format:", 26, CFSTR("Guarded operation <%@> timed out after <%lf> seconds"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    v2 = (void *)v6;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v7 = objc_msgSend(*(id *)(a1 + 40), "copy");
    if (v7)
    {
      v9 = (id)v7;
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v2);
      goto LABEL_9;
    }
  }
  v9 = 0;
LABEL_9:

}

@end
