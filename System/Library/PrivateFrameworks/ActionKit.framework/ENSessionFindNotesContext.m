@implementation ENSessionFindNotesContext

- (ENNotebook)scopeNotebook
{
  return self->_scopeNotebook;
}

- (void)setScopeNotebook:(id)a3
{
  objc_storeStrong((id *)&self->_scopeNotebook, a3);
}

- (unint64_t)scope
{
  return self->_scope;
}

- (void)setScope:(unint64_t)a3
{
  self->_scope = a3;
}

- (unint64_t)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(unint64_t)a3
{
  self->_sortOrder = a3;
}

- (EDAMNoteFilter)noteFilter
{
  return self->_noteFilter;
}

- (void)setNoteFilter:(id)a3
{
  objc_storeStrong((id *)&self->_noteFilter, a3);
}

- (EDAMNotesMetadataResultSpec)resultSpec
{
  return self->_resultSpec;
}

- (void)setResultSpec:(id)a3
{
  objc_storeStrong((id *)&self->_resultSpec, a3);
}

- (unint64_t)maxResults
{
  return self->_maxResults;
}

- (void)setMaxResults:(unint64_t)a3
{
  self->_maxResults = a3;
}

- (BOOL)requiresLocalMerge
{
  return self->_requiresLocalMerge;
}

- (void)setRequiresLocalMerge:(BOOL)a3
{
  self->_requiresLocalMerge = a3;
}

- (BOOL)sortAscending
{
  return self->_sortAscending;
}

- (void)setSortAscending:(BOOL)a3
{
  self->_sortAscending = a3;
}

- (NSArray)allNotebooks
{
  return self->_allNotebooks;
}

- (void)setAllNotebooks:(id)a3
{
  objc_storeStrong((id *)&self->_allNotebooks, a3);
}

- (NSMutableArray)linkedNotebooksToSearch
{
  return self->_linkedNotebooksToSearch;
}

- (void)setLinkedNotebooksToSearch:(id)a3
{
  objc_storeStrong((id *)&self->_linkedNotebooksToSearch, a3);
}

- (NSMutableArray)findMetadataResults
{
  return self->_findMetadataResults;
}

- (void)setFindMetadataResults:(id)a3
{
  objc_storeStrong((id *)&self->_findMetadataResults, a3);
}

- (NSSet)resultGuidsFromBusiness
{
  return self->_resultGuidsFromBusiness;
}

- (void)setResultGuidsFromBusiness:(id)a3
{
  objc_storeStrong((id *)&self->_resultGuidsFromBusiness, a3);
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_resultGuidsFromBusiness, 0);
  objc_storeStrong((id *)&self->_findMetadataResults, 0);
  objc_storeStrong((id *)&self->_linkedNotebooksToSearch, 0);
  objc_storeStrong((id *)&self->_allNotebooks, 0);
  objc_storeStrong((id *)&self->_resultSpec, 0);
  objc_storeStrong((id *)&self->_noteFilter, 0);
  objc_storeStrong((id *)&self->_scopeNotebook, 0);
}

@end
