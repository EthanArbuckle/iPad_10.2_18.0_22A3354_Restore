@implementation ZN2vp2vx2io13Graph

_QWORD *___ZN2vp2vx2io13Graph_Builder5buildEN10applesauce8dispatch2v15queueE_block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int *v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  __int128 v10;
  unsigned int v11;

  v4 = *(unsigned int **)(a1 + 40);
  v11 = a2;
  v5 = boost::container::flat_map<vp::vx::io::Object_ID<vp::vx::io::Node>,std::shared_ptr<vp::vx::io::Node_Factory>,std::less<vp::vx::io::Object_ID<vp::vx::io::Node>>,vp::Allocator<std::pair<vp::vx::io::Object_ID<vp::vx::io::Node>,std::shared_ptr<vp::vx::io::Node_Factory>>>>::priv_subscript((_QWORD *)v4 + 10, &v11);
  (***(void (****)(_QWORD *__return_ptr, _QWORD, _QWORD, _QWORD))v5)(v9, *(_QWORD *)v5, *v4, *((_QWORD *)v4 + 4));
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 32 * a2;
  v7 = v9[0];
  v9[0] = 0;
  std::unique_ptr<vp::vx::io::Node,vp::Allocator_Delete<vp::vx::io::Node>>::reset[abi:ne180100]((_QWORD *)v6, v7);
  *(_QWORD *)(v6 + 8) = v9[1];
  *(_OWORD *)(v6 + 16) = v10;
  return std::unique_ptr<vp::vx::io::Node,vp::Allocator_Delete<vp::vx::io::Node>>::reset[abi:ne180100](v9, 0);
}

@end
