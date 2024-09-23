@implementation ZN20SymbolicationSession23registerKtraceCallbacksEv

uint64_t *___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke_4(uint64_t a1, uint64_t a2)
{
  SymbolicationSession *v3;

  v3 = *(SymbolicationSession **)(a1 + 32);
  SymbolicationSession::updateKdebugLibraryView(v3);
  return SymbolicationSession::handleInterrupt((uint64_t)v3, a2);
}

uint64_t *___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke_5(uint64_t a1, uint64_t a2)
{
  SymbolicationSession *v3;

  v3 = *(SymbolicationSession **)(a1 + 32);
  SymbolicationSession::updateKdebugLibraryView(v3);
  return SymbolicationSession::handleUserStack((uint64_t *)v3, a2);
}

uint64_t *___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke_6(uint64_t a1, uint64_t a2)
{
  SymbolicationSession *v3;

  v3 = *(SymbolicationSession **)(a1 + 32);
  SymbolicationSession::updateKdebugLibraryView(v3);
  return SymbolicationSession::handleRealFault((uint64_t *)v3, a2);
}

uint64_t *___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke_7(uint64_t a1, uint64_t a2)
{
  SymbolicationSession *v3;

  v3 = *(SymbolicationSession **)(a1 + 32);
  SymbolicationSession::updateKdebugLibraryView(v3);
  return SymbolicationSession::handleKPCHandler((uint64_t *)v3, a2);
}

uint64_t *___ZN20SymbolicationSession23registerKtraceCallbacksEv_block_invoke_8(uint64_t a1, uint64_t a2)
{
  SymbolicationSession *v3;

  v3 = *(SymbolicationSession **)(a1 + 32);
  SymbolicationSession::updateKdebugLibraryView(v3);
  return SymbolicationSession::handleDTraceProbe((uint64_t *)v3, a2);
}

@end
