@implementation ZN5Phase10Controller19SharedEntityManager22GetOrCreateHeadTrackerEv

CFTypeRef **___ZN5Phase10Controller19SharedEntityManager22GetOrCreateHeadTrackerEv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  Phase::Controller::HeadTracker *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (Phase::Controller::HeadTracker *)operator new();
  Phase::Controller::HeadTracker::HeadTracker(v2);
  return std::unique_ptr<Phase::Controller::HeadTracker>::reset[abi:ne180100]((CFTypeRef ***)(v1 + 152), (CFTypeRef **)v2);
}

@end
