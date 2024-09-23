@implementation MPCAssistantCommand

- (void)sendCommand:(unsigned int)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = *(_QWORD *)&a3;
  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __72__MPCAssistantCommand_sendCommand_toDestination_withOptions_completion___block_invoke;
  v12[3] = &unk_24CAB9DF0;
  v13 = v10;
  v11 = v10;
  -[MPCAssistantCommand sendCommandWithResult:toDestination:withOptions:completion:](self, "sendCommandWithResult:toDestination:withOptions:completion:", v8, a4, a5, v12);

}

- (void)sendPlaybackQueue:(id)a3 toDestination:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__MPCAssistantCommand_sendPlaybackQueue_toDestination_completion___block_invoke;
  v10[3] = &unk_24CAB9DF0;
  v11 = v8;
  v9 = v8;
  -[MPCAssistantCommand sendPlaybackQueueWithResult:toDestination:completion:](self, "sendPlaybackQueueWithResult:toDestination:completion:", a3, a4, v10);

}

- (void)sendPlaybackQueueWithResult:(id)a3 toDestination:(id)a4 completion:(id)a5
{
  -[MPCAssistantCommand sendPlaybackQueueWithResult:toDestination:withOptions:completion:](self, "sendPlaybackQueueWithResult:toDestination:withOptions:completion:", a3, a4, MEMORY[0x24BDBD1B8], a5);
}

- (void)sendPlaybackQueue:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__MPCAssistantCommand_sendPlaybackQueue_toDestination_withOptions_completion___block_invoke;
  v12[3] = &unk_24CAB9DF0;
  v13 = v10;
  v11 = v10;
  -[MPCAssistantCommand sendPlaybackQueueWithResult:toDestination:withOptions:completion:](self, "sendPlaybackQueueWithResult:toDestination:withOptions:completion:", a3, a4, a5, v12);

}

- (void)sendPlaybackArchive:(id)a3 toDestination:(id)a4 completion:(id)a5
{
  -[MPCAssistantCommand sendPlaybackArchive:toDestination:withOptions:completion:](self, "sendPlaybackArchive:toDestination:withOptions:completion:", a3, a4, 0, a5);
}

- (void)sendPlaybackArchive:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __80__MPCAssistantCommand_sendPlaybackArchive_toDestination_withOptions_completion___block_invoke;
  v12[3] = &unk_24CAB9DF0;
  v13 = v10;
  v11 = v10;
  -[MPCAssistantCommand sendPlaybackArchiveWithResult:toDestination:withOptions:completion:](self, "sendPlaybackArchiveWithResult:toDestination:withOptions:completion:", a3, a4, a5, v12);

}

- (void)sendPlaybackArchiveWithResult:(id)a3 toDestination:(id)a4 completion:(id)a5
{
  -[MPCAssistantCommand sendPlaybackArchiveWithResult:toDestination:withOptions:completion:](self, "sendPlaybackArchiveWithResult:toDestination:withOptions:completion:", a3, a4, MEMORY[0x24BDBD1B8], a5);
}

- (void)sendCommandWithResult:(unsigned int)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  MPCAssistantCommandInternal *v12;

  v8 = *(_QWORD *)&a3;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = objc_alloc_init(MPCAssistantCommandInternal);
  -[MPCAssistantCommandInternal sendCommandWithResult:toDestination:withOptions:completion:](v12, "sendCommandWithResult:toDestination:withOptions:completion:", v8, v11, v10, v9);

}

- (void)sendPlaybackQueueWithResult:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  MPCAssistantCommandInternal *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(MPCAssistantCommandInternal);
  -[MPCAssistantCommandInternal sendPlaybackQueueWithResult:toDestination:withOptions:completion:](v13, "sendPlaybackQueueWithResult:toDestination:withOptions:completion:", v12, v11, v10, v9);

}

- (void)sendPlaybackArchiveWithResult:(id)a3 toDestination:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  MPCAssistantCommandInternal *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(MPCAssistantCommandInternal);
  -[MPCAssistantCommandInternal sendPlaybackArchiveWithResult:toDestination:withOptions:completion:](v13, "sendPlaybackArchiveWithResult:toDestination:withOptions:completion:", v12, v11, v10, v9);

}

void __80__MPCAssistantCommand_sendPlaybackArchive_toDestination_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "returnStatuses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

void __78__MPCAssistantCommand_sendPlaybackQueue_toDestination_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "returnStatuses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

void __66__MPCAssistantCommand_sendPlaybackQueue_toDestination_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "returnStatuses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

void __72__MPCAssistantCommand_sendCommand_toDestination_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "error");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "returnStatuses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

@end
