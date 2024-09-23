@implementation REDebugRendererDrawCollisionWorld

void __REDebugRendererDrawCollisionWorld_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  __int128 v7;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)&v9 = a2;
  *((_QWORD *)&v9 + 1) = a3;
  *(_QWORD *)&v8 = a4;
  *((_QWORD *)&v8 + 1) = a5;
  *(_QWORD *)&v7 = a6;
  *((_QWORD *)&v7 + 1) = a7;
  re::DebugRenderer::drawLine(*(os_unfair_lock_s **)(a1 + 32), &v9, &v8, &v7, 1);
}

void __REDebugRendererDrawCollisionWorld_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, float a6)
{
  __int128 v6;
  __int128 v7;

  *(_QWORD *)&v7 = a2;
  *((_QWORD *)&v7 + 1) = a3;
  *(_QWORD *)&v6 = a4;
  *((_QWORD *)&v6 + 1) = a5;
  re::DebugRenderer::drawPoint(*(os_unfair_lock_s **)(a1 + 32), &v7, &v6, 1, a6);
}

@end
