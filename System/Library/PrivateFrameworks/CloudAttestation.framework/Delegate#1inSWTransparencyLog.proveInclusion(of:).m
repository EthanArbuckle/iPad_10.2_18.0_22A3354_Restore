@implementation Delegate#1inSWTransparencyLog.proveInclusion(of:)

- (void)URLSession:()of: didReceiveChallenge:completionHandler:
{
  _QWORD *v8;
  uint64_t v9;
  void (*v10)(_QWORD *, _QWORD, uint64_t);
  id v11;
  id v12;
  _TtCFV16CloudAttestation17SWTransparencyLog14proveInclusionFzZT2ofVS_7Release_VS_21TransparencyLogProofsL_8Delegate *v13;

  v8 = _Block_copy(a5);
  v9 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCFV16CloudAttestation17SWTransparencyLog14proveInclusionFzZT2ofVS_7Release_VS_21TransparencyLogProofsL_8Delegate_credential);
  v10 = (void (*)(_QWORD *, _QWORD, uint64_t))v8[2];
  v11 = a3;
  v12 = a4;
  v13 = self;
  v10(v8, 0, v9);
  _Block_release(v8);

}

- (_TtCFV16CloudAttestation17SWTransparencyLog14proveInclusionFzZT2ofVS_7Release_VS_21TransparencyLogProofsL_8Delegate)init
{
  _TtCFV16CloudAttestation17SWTransparencyLog14proveInclusionFzZT2ofVS_7Release_VS_21TransparencyLogProofsL_8Delegate *result;

  result = (_TtCFV16CloudAttestation17SWTransparencyLog14proveInclusionFzZT2ofVS_7Release_VS_21TransparencyLogProofsL_8Delegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCFV16CloudAttestation17SWTransparencyLog14proveInclusionFzZT2ofVS_7Release_VS_21TransparencyLogProofsL_8Delegate_credential));
}

@end
